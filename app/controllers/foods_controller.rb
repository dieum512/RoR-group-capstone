class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    user = current_user
    food = user.foods.new(params.require(:food).permit(:name, :measurement_unit, :price, :quantity))
    if food.save
      redirect_to '/foods', notice:"Food created successfully"
    else
      flash[:alert] = "An error occured when creating the food"
      redirect_to '/foods'
    end
  end
end
