class GeneralShoppingListController < ApplicationController
  def index
    redirect_to '/public_recipes' unless user_signed_in?
    @total_value = 0
    @recipe_foods = []
    recipes = current_user.recipes
    recipes.each do |recipe|
      new_recipe_foods = recipe.recipe_foods.includes(:food).select do |recipe_food|
        food = recipe_food.food
        user_food = current_user.foods.find_by(name: food.name, measurement_unit: food.measurement_unit)
        @total_value += recipe_food.process_cost(user_food)
        recipe_food.process_quantity(user_food).positive?
      end

      @recipe_foods += new_recipe_foods
    end

    @items_to_buy = @recipe_foods.count
  end
end
