require 'rails_helper'

RSpec.describe "food_recipes/index", type: :view do
  before(:each) do
    assign(:food_recipes, [
      FoodRecipe.create!(),
      FoodRecipe.create!()
    ])
  end

  it "renders a list of food_recipes" do
    render
  end
end
