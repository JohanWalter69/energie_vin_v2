class ProductsController < ApplicationController
  def index
    @reviews = Review.all
    search
  end

  private

  def search
    if params[:min_price].present? && params[:max_price].present?
      @products = Product.where(price: params[:min_price]..).where(price: ..params[:max_price])
    else
      @products = Product.all
    end
  end
end
