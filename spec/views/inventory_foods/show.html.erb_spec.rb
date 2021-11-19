require 'rails_helper'

RSpec.describe "inventory_foods/show", type: :view do
  before(:each) do
    @inventory_food = assign(:inventory_food, InventoryFood.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
