class GeneralShoppingListController < ApplicationController
  def index
    flash[:alert] = 'You are not connected'
    redirect_to '/public_recipes' unless user_signed_in?
    @foods = Food.all
  end
end
