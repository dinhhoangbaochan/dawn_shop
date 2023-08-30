class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  # List all products
  def index
    products = Product.all
    render json: products
  end

  # View a single product
  def show
    product = Product.find(params[:id])
    render json: product
  end

  # Create a new product
  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: :created
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  # Update an existing product
  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      render json: product
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  # Delete a product
  def destroy
    product = Product.find(params[:id])
    product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :brand_id, :field1, :field2, :field3, :field4, :field5)
  end
end