class OrdersController < ApplicationController
    before_action :authenticate_user!, only: [:create, :index, :show]

    def create
        return redirect_to new_card_path unless current_user.card.present?
        product = Product.find(params[:product_id]) # 購入する商品のレコードを取得
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPに秘密鍵を設定
        customer_id = current_user.card.customer_id # 顧客idを取得
        Payjp::Charge.create( # PAY.JPに購入価格と顧客id、通貨の種類を渡す
          amount: product.price,
          customer: customer_id,
          currency: 'jpy' 
        )
    
        current_user.orders.create(product_id: product.id) # 購入履歴テーブルに保存
        redirect_to root_path
    end

    def index
        @orders = Order.where(user_id: current_user.id)
    end

    def show
    end
    
    def company_index
    end


end
