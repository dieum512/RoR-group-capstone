class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  def process_quantity(user_food)
    return @quantity_needed = quantity unless user_food

    diff = user_food.quantity - quantity
    @quantity_needed = diff.negative? ? -diff : 0
  end

  def process_cost(user_food)
    @cost_required = (process_quantity(user_food) * food.price).round(2)
  end
end
