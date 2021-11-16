class FoodInventory < ApplicationRecord
  belongs_to :inventory
  belongs_to :food

  validates :food_id, presence: true, uniqueness: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
