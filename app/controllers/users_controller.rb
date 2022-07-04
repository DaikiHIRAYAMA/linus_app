class UsersController < ApplicationController
  def show
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPに秘密鍵を使ってアクセス
    card = Card.find_by(user_id: current_user.id) # cardsテーブルからユーザーのカード情報を取得
    if card.present?
    customer = Payjp::Customer.retrieve(card.customer_id) # 顧客idを元に、顧客情報を取得
    @card = customer.cards.first # cards.firstで登録した最初のカード情報を取得
    end
  end

  def index
  end
end
