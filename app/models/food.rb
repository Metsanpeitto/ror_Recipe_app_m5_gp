class Food < ApplicationRecord
  belongs_to :user
  has_many :foods_recipes, dependent: :destroy
  has_many :foods_inventories, dependent: :destroy

  validates :name, :measurement_unit, :price, presence: true
end
