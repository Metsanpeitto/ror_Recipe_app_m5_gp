require 'rails_helper'

RSpec.describe "food_recipes/new", type: :view do
  before(:each) do
    assign(:food_recipe, FoodRecipe.new())
  end

  it "renders new food_recipe form" do
    render

    assert_select "form[action=?][method=?]", food_recipes_path, "post" do
    end
  end
end
