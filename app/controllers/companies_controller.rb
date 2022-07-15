class CompaniesController < ApplicationController
before_action :authenticate_company!, only: [:index, :show]
before_action :correct_company, only: [:show]    
    def index
        @users = User.all#where(:id )#最悪消す
        #ユーザーIDから指定できる

        @products = Product.where(company_id: current_company.id)#.sum(:price) #OK
        @testers = Tester.where(company_id: current_company.id)#.sum(:price)   #OK


    end

    def show
    end


    private

    def correct_company
      @company = Company.find(params[:id])
      redirect_to current_company unless current_company?(@company)
    end
  
    def current_company?(company)
      company == current_company
    end
end
