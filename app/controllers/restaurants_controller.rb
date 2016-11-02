class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  #GET "restaurants"
  def index
    @restaurants = Restaurant.all
  end


  def show
  end

  #GET "restaurants/new"
  #POST "restaurants"
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  def create
    Restaurant.create(restaurant_params)
    redirect_to restaurants_path
  end


  # PATCH/PUT /restaurants/1
  def update
    flash[:notice] = "You have updated #{@restaurant.name}"
    @restaurant.update(restaurant_params)
    redirect_to restaurants_path
  end

  # DELETE /restaurants/1
  def destroy
   flash[:notice] = "You have deleted #{@restaurant.name}"

    @restaurant.destroy
    redirect_to restaurants_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    end
end


