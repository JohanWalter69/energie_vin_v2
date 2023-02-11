class ReviewsController < ApplicationController
  def index
    @products = Product.all
    @product = Product.find(params[:product_id])
    @reviews = Review.where(product_id: @product.id)
    average_rate
  end

  def average_rate
    @sum = 0
    @reviews.each do |review|
      @sum += review.rate
    end
    return @average = @sum / @reviews.count
  end
end
