class ReviewsController < ApplicationController

  def show
    @restaurant = find_restaurant
    @review = Review.find(params[:id])
  end

  def new
    @restaurant = find_restaurant
    @review = Review.new
  end

  def create
    @restaurant = find_restaurant
    @review = @restaurant.reviews.create(review_params)
    redirect_to restaurant_review_path(@restaurant, @review)
  end

  def destroy
    @restaurant = find_restaurant
    @review = @restaurant.reviews.find(params[:id])
    @review.destroy
    redirect_to restaurants_path
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def find_restaurant
    Restaurant.find(params[:restaurant_id])
  end

end
