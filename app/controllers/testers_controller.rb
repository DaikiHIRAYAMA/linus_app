class TestersController < ApplicationController
  before_action :set_tester, only: %i[ show edit update destroy tester_page ]
  before_action :authenticate_user!, only: [:tester_page] 
  before_action :authenticate_company!, only: [:index, :edit, :new, :show ] 
  before_action :correct_company_tester, only: [:show]  

  
  def create
    @tester = Tester.new(tester_params)

    respond_to do |format|
      if @tester.save
        format.html { redirect_to testers_path, notice: "テスターを登録しました" }
        format.json { render :show, status: :created, location: @tester }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tester.errors, status: :unprocessable_entity }
      end
    end
  end

  def index #OK
    @testers = Tester.where(company_id: current_company.id)
  end

  def show
  end

  def new
    @tester = Tester.new
  end

  def edit
  end

  def destroy
    unless TestOrder.where(tester_id: @tester.id).exists?

    @tester.destroy

    respond_to do |format|
      format.html { redirect_to testers_url, notice: "テスターを削除しました" }
      format.json { head :no_content }
    end
  else
    redirect_to testers_url, notice: "テスターは既に購入されているため、削除できません。"
  end
  end

  def update
    respond_to do |format|
      if @tester.update(tester_params)
        format.html { redirect_to testers_path, notice: "テスターを修正しました" }
        format.json { render :show, status: :ok, location: @tester}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tester.errors, status: :unprocessable_entity }
      end
    end
  end

  def tester_page
  end


  private
  
  def set_tester
    @tester = Tester.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tester_params
    params.require(:tester).permit(:id,:item_name, :price, :stock_quantity, :description, :image, :company_id)
  end

  def correct_company_tester
    @tester = Tester.find(params[:id])
    redirect_to current_company unless current_company_tester?(@tester)
  end

  def current_company_product?(tester)
    tester.company_id == current_company.id
  end

end
