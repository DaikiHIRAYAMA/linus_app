class CompaniesController < ApplicationController
before_action :authenticate_company!, only: [:index, :show]
    
    def index
        @users = User.all#where(:id )#最悪消す
        #ユーザーIDから指定できる

        @products = Product.where(company_id: current_company.id)#.sum(:price) #OK
        @testers = Tester.where(company_id: current_company.id)#.sum(:price)   #OK


       # @orders_money = Order.where(product_id: current_company.products.id)#.sum(:price)
       # @orders_count = Order.where(product_id: current_company.products.id).count



  #  if @testers.present?
  #     @testers.each do |tester|
  #          @test_orders_money.push(TestOrder.where(tester_id: tester.id)).sum(:price)
  #          @test_orders_count.push(TestOrder.where(tester_id: tester.id)).count

 #       end
  #  end

    end

    def show
    end

end
