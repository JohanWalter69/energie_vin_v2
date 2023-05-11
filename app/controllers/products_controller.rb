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

# Voir pour refacto les lignes ci-dessous et poser la condition Product.all en premier
  # def search
  #   if params[:min_price].present? && params[:max_price].present?
  #     @products = Product.where(price: params[:min_price]..).where(price: ..params[:max_price])
  #   elsif params[:min_price].present?
  #     @products = Product.where(price: params[:min_price]..)
  #   elsif params[:max_price].present?
  #     @products = Product.where(price: ..params[:max_price])
  #   else
  #     @products = Product.all
  #   end
  # end

# Méthode refactoriser / à tester
  def search
    @products = Product.all
    @products = @products.where("price >= ?", params[:min_price]) if params[:min_price].present?
    @products = @products.where("price <= ?", params[:max_price]) if params[:max_price].present?
  end

  def average_rate
    @sum = 0
    @reviews.each do |review|
      @sum += review.rate
    end
    return @average = @sum / @reviews.count
  end
end
