class TestOrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :authenticate_company!, only: [:company_index, :shipping]
  before_action :correct_company, only: [:company_index]  

  def create
    return redirect_to new_card_path unless current_user.card.present?
    tester = Tester.find(params[:tester_id]) # 購入するtesterのレコードを取得
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPに秘密鍵を設定
    customer_id = current_user.card.customer_id # 顧客idを取得
    #PAY.jpは50円以上でないと決済できない

    #1回目だけ購入できるようにする
    if current_user.test_orders.exists?(tester_id: tester.id,user_id: current_user.id)
      redirect_to tester_page_tester_path(params[:tester_id]), notice: "テスターは1度のみのご注文になります" 
    else
    if tester.stock_quantity >= 1

    Payjp::Charge.create( # PAY.JPに購入価格と顧客id、通貨の種類を渡す
      amount: tester.price,
      customer: customer_id,
      currency: 'jpy' 
    )
  

      current_user.test_orders.create(tester_id: tester.id, status: 0, user_id: current_user.id) # テスター購入履歴テーブルに保存,statusを受注で登録
      tester.update(stock_quantity: tester.stock_quantity - 1 )#在庫数を減らして更新する 
      
      UserMailer.with(to: current_user.email, name: current_user.name, price: tester.price, item_name: tester.item_name, date: Date.today, address_city: current_user.address_city, address_street: current_user.address_street, address_building: current_user.address_building).buy.deliver_now
      redirect_to root_path, notice: "テスターを購入しました" #遷移先

    else
      redirect_to tester_path(params[:tester_id]), notice: "現在お取り扱いできません" #購入できなかった場合

    end
    end
  end


  def company_index #OK
    @testers = Tester.where(company_id: current_company.id)

  end

  def update
    @tester = Tester.find(params[:product_id])  # 1.インスタンス変数にセット
    @tester.update(tester_params)   # 2.updateメソッドの実行
  end

  def shipping
    test_order = TestOrder.find(params[:id])
    tester = Tester.find(test_order.tester_id)
    user = User.find(test_order.user_id)
    UserMailer.with(to: user.email, name: user.name, price: tester.price, item_name: tester.item_name, date: Date.today, address_city: user.address_city, address_street: user.address_street, address_building: user.address_building).shipping.deliver_now
    test_order.update(status: "ordered" )
    redirect_to company_index_test_order_path(current_company.id),notice: "お客様に発送メールを送信しました。"
end


  private
  def tester_params
    params.require(:tester).permit(:stock_quantity)
  end

  def correct_company
    @company = Company.find(params[:id])
    redirect_to current_company unless current_company?(@company)
  end

  def current_company?(company)
    company == current_company
  end


end
