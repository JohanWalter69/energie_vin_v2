class ProductsController < ApplicationController
  def index
    @reviews = Review.all
    search
  end

  def show
    @product = Product.find(params[:id])
    @reviews = Review.where(product_id: @product.id)
    @user = current_user
    average_rate
  end

  private

  def search
    if params[:min_price].present? && params[:max_price].present?
      @products = Product.where(price: params[:min_price]..).where(price: ..params[:max_price])
    elsif params[:min_price].present?
      @products = Product.where(price: params[:min_price]..)
    elsif params[:max_price].present?
      @products = Product.where(price: ..params[:max_price])
    else
      @products = Product.all
    end
  end

  def average_rate
    @sum = 0
    @reviews.each do |review|
      @sum += review.rate
    end
    return @average = @sum / @reviews.count
  end
end
