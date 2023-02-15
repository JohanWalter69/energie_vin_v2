class ReviewsController < ApplicationController
  def new
    @user = current_user
    if @user.expert?
      @product = Product.find(params[:product_id])
      @review = Review.new
    else
      render file: "public/404.html", status: :unauthorized
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = @product
    @review.user = current_user
    if @review.save
      redirect_to product_path(@product)
    else
      flash[:alert] = "Enter a number between 0 and 5"
      redirect_to product_path(@product), status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rate, :product_id, :user_id)
  end
end
