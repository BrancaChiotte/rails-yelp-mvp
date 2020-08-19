class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    set_restaurant
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # get the params from the form
    @restaurant = Restaurant.new(restaurant_params)
    # Save the review
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
