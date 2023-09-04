class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :recipes, throught: :recipe_foods
end
