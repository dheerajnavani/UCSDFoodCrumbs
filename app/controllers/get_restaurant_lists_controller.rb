include GetRestaurantListHelper
class GetRestaurantListsController < ApplicationController


#helper GetRestaurantListHelper
#need the filter
before_filter :ensure_params_exist
  # GET /get_restaurant_lists
  # GET /get_restaurant_lists.json

  def index

     #1. Check to see if we can process this anyway?

    #@get_restaurant_lists = GetRestaurantList.find(user_params)
      @get_restaurant_lists = GetRestaurantList.all
   puts get_route_directions_json(params)

    #2. Check to see if Google request is ok


    #3. Check to see if Yelp request is ok

    #4. Get the list and return it
    render json: @get_restaurant_lists, status: 422
  end

  # GET /get_restaurant_lists/1
  # GET /get_restaurant_lists/1.json
  def show
    @get_restaurant_list = GetRestaurantList.find(params[:id])

    render json: @get_restaurant_list
  end

  # POST /get_restaurant_lists
  # POST /get_restaurant_lists.json
  def create
    @get_restaurant_list = GetRestaurantList.new(params[:get_restaurant_list])

    if @get_restaurant_list.save
      render json: @get_restaurant_list, status: :created, location: @get_restaurant_list
    else
      render json: @get_restaurant_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /get_restaurant_lists/1
  # PATCH/PUT /get_restaurant_lists/1.json
  def update
    @get_restaurant_list = GetRestaurantList.find(params[:id])

    if @get_restaurant_list.update(params[:get_restaurant_list])
      head :no_content
    else
      render json: @get_restaurant_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /get_restaurant_lists/1
  # DELETE /get_restaurant_lists/1.json
  def destroy
    @get_restaurant_list = GetRestaurantList.find(params[:id])
    @get_restaurant_list.destroy

    head :no_content
  end
protected
   
private
  def ensure_params_exist
return unless params[:origin].blank?
render :json=>{:success=>false, :message=>"missing user_login parameter"}, :status=>0
end
 end
