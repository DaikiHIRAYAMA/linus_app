class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy product_page ]
  before_action :authenticate_user!, only: [:product_page, :scan]
  before_action :authenticate_company!, only: [:index, :edit, :new, :show ]
  before_action :correct_company_product, only: [:show]  
  # GET /products or /products.json
  def index #OK
    @products = Product.where(company_id: current_company.id)
  end

  def scan
   # @product = Product.new
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "商品を登録しました" }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "商品を修正しました" }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    unless Order.where(product_id: @product.id).exists?
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "商品を削除しました" }
      format.json { head :no_content }
    end
  else
    redirect_to products_url, notice: "商品は既に購入されているため、削除できません。"
  end

  end

  def product_page
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:id,:item_name, :price, :stock_quantity, :description, :image, :company_id)
    end

    def correct_company_product
      @product = Product.find(params[:id])
      redirect_to current_company unless current_company_product?(@product)
    end
  
    def current_company_product?(product)
      product.company_id == current_company.id
    end

end
