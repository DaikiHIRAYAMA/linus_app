class CardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    redirect_to root_path if user_signed_in? && current_user.card
  end

  def create
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    customer = Payjp::Customer.create(
      description: 'test', 
      card: params[:token_id] 
    )

    card = Card.new(
      customer_id: customer.id,
      token_id: params[:token_id],
      user_id: current_user.id
    )

    if card.save
      redirect_to root_path
    else
      redirect_to new_card_path
    end 
  end


end
