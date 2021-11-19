require 'rails_helper'

RSpec.describe "inventory_foods/index", type: :view do
  before(:each) do
    assign(:inventory_foods, [
      InventoryFood.create!(),
      InventoryFood.create!()
    ])
  end

  it "renders a list of inventory_foods" do
    render
  end
end
