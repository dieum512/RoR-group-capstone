class RecipeFoodsController < ApplicationController

  def new
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    redirect_to '/public_recipes' unless user_signed_in?
    user = current_user
    food = user.foods.new(params.require(:recipe_food).permit(:name, :measurement_unit, :price, :quantity))
    if food.save
      @recipe = Recipe.find(params[:recipe_id])
      recipe_food = RecipeFood.new(recipe: @recipe, food: food, quantity: params[:quantity])
      if recipe_food.save
        redirect_to "/recipes/#{params[:recipe_id]}", notice: 'Food created successfully'
      else
        flash[:alert] = 'An error occured when creating the recipe food'
        redirect_to "/recipes/#{params[:recipe_id]}"
      end
    else
      flash[:alert] = 'An error occured when creating the recipe food'
      redirect_to "/recipes/#{params[:recipe_id]}"
    end
  end
end
