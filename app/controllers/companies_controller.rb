class CompaniesController < ApplicationController
before_action :authenticate_company!, only: [:index, :show]
    
    def index
        @users = User.all
        @products = Product.all.sum(:price)
        @orders = Order.all.order(created_at: "DESC")
        @testers = Tester.all.sum(:price)
        @test_orders = TestOrder.all.order(created_at: "DESC")
        
    end

    def show
    end

end
