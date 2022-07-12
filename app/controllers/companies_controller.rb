class CompaniesController < ApplicationController
    
    def index
        @users = User.all
        @products = Product.all.sum(:price)
        @orders = Order.all.order(created_at: "DESC")
        
    end

    def show
    end

end
