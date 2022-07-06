class CompaniesController < ApplicationController
    
    def index
        @users = User.all
        @products = Product.all.sum(:price)
        @orders = Order.all
        #あとで書き換える
    end

    def show
    end

end
