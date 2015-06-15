class RestaurantsController < ApplicationController

  def show
    @restaurant = Restaurant.find(params[:id])
    # @reviews = Review.find_by()
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def index
    @restaurants = Restaurant.all
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path
  end

  def destroy
    @restaurant = Restaurant.find(params[:index])
    @restaurant.destroy
    redirect_to restaurants_path
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end


end
