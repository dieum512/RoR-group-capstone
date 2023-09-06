class GeneralShoppingListController < ApplicationController
  def index
    @foods = Food.all
  end
end
