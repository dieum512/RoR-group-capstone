class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods, dependent: :destroy
  validates :name, :preparation_time, :description, :cooking_time, presence: true
end
