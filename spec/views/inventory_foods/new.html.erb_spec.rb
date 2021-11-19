require 'rails_helper'

RSpec.describe "inventory_foods/new", type: :view do
  before(:each) do
    assign(:inventory_food, InventoryFood.new())
  end

  it "renders new inventory_food form" do
    render

    assert_select "form[action=?][method=?]", inventory_foods_path, "post" do
    end
  end
end
