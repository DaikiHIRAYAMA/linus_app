class CompaniesController < ApplicationController
    
    def index
        @users = User.all
        @products = Product.all.sum(:price)
        @orders = Order.all
        
    end

    def show
    end

end
