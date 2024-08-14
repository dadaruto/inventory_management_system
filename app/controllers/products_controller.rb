class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
  @products = Product.all

  # Ensure calculations handle nil values and default to 0 if necessary
  @total_money_in = @products.sum do |product|
    opening_stock = product.opening_stock.to_i || 0
    closing_stock = product.closing_stock.to_i || 0
    price = product.price.to_f || 0.0

    (opening_stock - closing_stock) * price
  end

  # Default to 0.0 if no records are found
  @total_expenses = Expense.sum(:amount).to_f || 0.0
  @total_debts = Debt.sum(:amount).to_f || 0.0

  # Calculate the total net amount
  @total_net_amount = @total_money_in - @total_expenses - @total_debts
end

  def show
    # The @product instance variable is set by the set_product callback
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
    # The @product instance variable is set by the set_product callback
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to products_url, alert: 'Product not found.'
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :size, :opening_stock, :closing_stock, :expenses, :debts)
  end
end

