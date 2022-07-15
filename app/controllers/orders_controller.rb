class OrdersController < ApplicationController
    before_action :authenticate_user!, only: [:create, :index]
    before_action :authenticate_company!, only: [:company_index, :shipping]


    def create #OK
        return redirect_to new_card_path unless current_user.card.present?
        product = Product.find(params[:product_id]) # 購入する商品のレコードを取得
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPに秘密鍵を設定
        customer_id = current_user.card.customer_id # 顧客idを取得
       
        if product.stock_quantity >= 1 #在庫が0より多い場合
       
        Payjp::Charge.create( # PAY.JPに購入価格と顧客id、通貨の種類を渡す
          amount: product.price,
          customer: customer_id,
          currency: 'jpy' 
        )       
        current_user.orders.create(product_id: product.id, status: 0, user_id: current_user.id) # 購入履歴テーブルに保存,statusを受注で登録

        product.update(stock_quantity: product.stock_quantity - 1 )#在庫数を減らして更新する
        UserMailer.with(to: current_user.email, name: current_user.name, price: product.price, item_name: product.item_name, date: Date.today, address_city: current_user.address_city, address_street: current_user.address_street, address_building: current_user.address_building).buy.deliver_now
        redirect_to root_path , notice: "商品を購入しました" #遷移先

        else
        redirect_to product_path(params[:product_id]), notice: "現在お取り扱いできません" #購入できなかった場合

        end

    end

    def index #OK
        @orders = Order.where(user_id: current_user.id)
        #自身が購入したものを表示（商品）

        @test_orders = TestOrder.where(user_id: current_user.id)
        #自身が購入されたものを表示（テスター）

        @recomends = Tester.all
        #テスター全体から既に購入したものを除く→viewで処理を行った
    end

    def company_index #OK
        @products = Product.where(company_id: current_company.id)

    end

    def update
        @product = Product.find(params[:product_id])  # 1.インスタンス変数にセット
        @product.update(product_params)   # 2.updateメソッドの実行
    end

    def shipping
        order = Order.find(params[:id])
        product = Product.find(order.product_id)
        user = User.find(order.user_id)
        UserMailer.with(to: user.email, name: user.name, price: product.price, item_name: product.item_name, date: Date.today, address_city: user.address_city, address_street: user.address_street, address_building: user.address_building).shipping.deliver_now
        order.update(status: "ordered" )
        redirect_to company_index_order_path(current_company.id),notice: "お客様に発送メールを送信しました。"
    end

    private
    def product_params
      params.require(:product).permit(:stock_quantity)
    end

end
