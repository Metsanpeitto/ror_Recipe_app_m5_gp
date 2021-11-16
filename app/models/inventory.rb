class Inventory < ApplicationRecord
  belongs_to :user
  has_many :foods_inventories, dependent: :destroy
  has_many :foods, through: :foods_inventories, dependent: :destroy

  validates :name, presence: true
end
