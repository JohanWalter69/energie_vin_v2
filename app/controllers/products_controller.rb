class ProductsController < ApplicationController
  def index
    @reviews = Review.all
    @products = Product.all
  end
end
