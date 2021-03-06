class FoodRecipe < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :food_id, presence: true, uniqueness: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
