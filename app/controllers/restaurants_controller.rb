class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: %i[update show destroy]

    def index
        @restaurants = Restaurant.all
        render json: @restaurants
    end

    def show
        render json: @restaurant
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
            render json: @restaurant, status: :created
        else
            render json: @restaurant.errors, status: :unprocessable_entity
        end
    end

    def update
        @restaurant.update(restaurant_params)
        head :no_content
    end

    def destroy
        @restaurant.destroy
        head :no_content
    end

    private

    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
        params.require(:restaurant).permit(:name, :restaurant_type, :address, :rating)
    end
    




end
