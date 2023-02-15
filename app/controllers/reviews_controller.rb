class ReviewsController < ApplicationController
  before_action :set_review, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.product = @product
    @review.user = current_user
    if @review.save
      redirect to product_reviews_path(@product)
    else
      redirect to product_reviews_path(@product), status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rate, :product_id, :user_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
