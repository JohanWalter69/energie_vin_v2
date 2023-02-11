class ProductsController < ApplicationController
  def index
    @reviews = Review.all
    if params[:max_price].present?
      @products = Product.where(price: params[:max_price])
    else
      @products = Product.all
    end
  end
end
