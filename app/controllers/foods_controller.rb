class FoodsController < ApplicationController
  def index
    flash[:alert] = "You are not connected"
    redirect_to '/public_recipes' unless user_signed_in?
    @foods = Food.all
  end

  def new
    flash[:alert] = "You are not connected"
    redirect_to '/public_recipes' unless user_signed_in?
    @food = Food.new
  end

  def create
    flash[:alert] = "You are not connected"
    redirect_to '/public_recipes' unless user_signed_in?
    user = current_user
    food = user.foods.new(params.require(:food).permit(:name, :measurement_unit, :price, :quantity))
    if food.save
      redirect_to '/foods', notice: 'Food created successfully'
    else
      flash[:alert] = 'An error occured when creating the food'
      redirect_to '/foods'
    end
  end
end
