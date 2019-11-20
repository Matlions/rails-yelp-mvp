class RestaurantsController < ApplicationController
  # GET /restaurants
  before_action :set_restaurant, only: %i[show  update ] #edit

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end



  # # GET /restaurants/1/edit
  # def edit
  # end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
