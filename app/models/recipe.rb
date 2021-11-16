class Recipe < ApplicationRecord
  belongs_to :user
  has_many :foods_recipes, dependent: :destroy
  has_many :foods, through: :foods_recipes, dependent: :destroy

  validates :name, :preparation_time, :cooking_time, :description, presence: true
end
