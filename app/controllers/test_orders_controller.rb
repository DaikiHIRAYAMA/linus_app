class TestOrdersController < ApplicationController
  def create
    return redirect_to new_card_path unless current_user.card.present?
    product = Product.find(params[:product_id]) # 購入する商品のレコードを取得
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPに秘密鍵を設定
    customer_id = current_user.card.customer_id # 顧客idを取得
    Payjp::Charge.create( # PAY.JPに購入価格と顧客id、通貨の種類を渡す
      amount: tester.price,
      customer: customer_id,
      currency: 'jpy' 
    )

    #1回目だけ購入できるようにする
    #if product.stock_quantity >= 1 #在庫が0より多い場合
    #current_user.orders.create(product_id: product.id, status: 0) # 購入履歴テーブルに保存,statusを受注で登録

    #product.update(stock_quantity: product.stock_quantity - 1 )#在庫数を減らして更新する 
    #redirect_to root_path #遷移先

    #else
    #redirect_to product_path(params[:product_id]), notice: "現在お取り扱いできません" #購入できなかった場合

    #end
  end

  def index
    @test_orders = TestOrder.where(user_id: current_user.id)
  end

  def company_index
    @test_orders = TestOrder.all.order(created_at: "DESC")#.where(user_id: current_user.id)
  end

  def update
    @tester = Tester.find(params[:product_id])  # 1.インスタンス変数にセット
    @tester.update(tester_params)   # 2.updateメソッドの実行
  end

  private
  def tester_params
    params.require(:tester).permit(:stock_quantity)
  end

end
