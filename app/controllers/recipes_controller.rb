class RecipesController < ApplicationController
  def index
    flash[:alert] = 'You are not connected'
    redirect_to '/public_recipes' unless user_signed_in?
    return unless user_signed_in?

    @recipes = current_user.recipes
  end

  def show
    flash[:alert] = 'You are not connected'
    redirect_to '/public_recipes' unless user_signed_in?
    @recipe = Recipe.find(params[:id])
    # @foods = RecipeFood.includes(:food)
    @foods = RecipeFood.includes(:food).where(recipe: @recipe)
  end

  def new
    flash[:alert] = 'You are not connected'
    redirect_to '/public_recipes' unless user_signed_in?
    @recipe = Recipe.new
  end

  def create
    flash[:alert] = 'You are not connected'
    redirect_to '/public_recipes' unless user_signed_in?
    @user = current_user
    @recipe = @user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to '/recipes', notice: 'Food created successfully'
    else
      flash[:alert] = 'An error occured when creating the food'
      redirect_to '/recipes'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html do
        redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
      end
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
