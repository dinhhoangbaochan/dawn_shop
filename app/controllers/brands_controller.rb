# app/controllers/brands_controller.rb

class BrandsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @brands = Brand.all
    render json: @brands
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      redirect_to brands_path
    else
      render :new
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update(brand_params)
      redirect_to brands_path
    else
      render :edit
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    redirect_to brands_path
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :field1, :field2, :field3, :field4, :field5)
  end
end
