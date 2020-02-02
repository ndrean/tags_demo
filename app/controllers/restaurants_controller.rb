class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @user = current_user
    @restaurant = Restaurant.new
  end

  def create
    
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save      
      redirect_to "\/restaurants\/#{@restaurant.id}"
      #redirect_to restaurant_path(@restaurant)
    else
      flash[:notice] = @note.errors.full_messages.join
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @related_restaurants = @restaurant.find_related_tags
  end

  # def tagged
  #   if params[:tag].present?
  #     @restaurants = Restaurant.tagged_with(params[:tag])
  #   else
  #     @restaurants = Restaurant.all
  #   end
  # end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, tag_list: [])
    # tags are inputted as checkboxes
  end

end
