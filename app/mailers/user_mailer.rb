class UserMailer < ApplicationMailer

    def buy #productとtesterの購入時に送る
        @price = params[:price] 
        @item_name = params[:item_name] 
        @date = params[:date] 
        @address_city = params[:address_city] 
        @address_street = params[:address_street] 
        @address_building = params[:address_building] 
        @name = params[:name]
        # インスタンス変数に代入すると次のビューで使える
        mail(to: params[:to], subject: "ご注文いただき誠にありがとうございます。") # メール送信
    end

    def shipping
        @price = params[:price] 
        @item_name = params[:item_name] 
        @date = params[:date] 
        @address_city = params[:address_city] 
        @address_street = params[:address_street] 
        @address_building = params[:address_building] 
        @name = params[:name]

        mail(to: params[:to], subject: "ご注文いただいた商品を発送いたしました") # メール送信
    end
end
