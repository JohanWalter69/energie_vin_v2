class ProductsController < ApplicationController
  def index
    @reviews = Review.all
    if params[:min_price].present? && params[:max_price].present?
      @products = Product.where(price: ..params[:max_price]).where(price: params[:min_price]..)
    else
      @products = Product.all
    end
  end
end
