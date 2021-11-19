class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]
  before_action :set_foods, only: %i[edit new update]

  # GET /recipe_foods/new
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
    @food = @recipe.foods.new
    set_foods
  end

  # GET /recipe_foods/1/edit
  def edit; end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html do
          redirect_to recipe_path(recipe_food_params[:recipe_id]), notice: 'Recipe food was successfully created.'
        end
      else
        set_foods
        byebug
        @recipe_food = RecipeFood.where(recipe_food_params[:recipe_id])
        format.html do
          redirect_to edit_recipe_recipe_food_path(id), status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /recipe_foods/1 or /recipe_foods/1.json
  def update
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html do
          redirect_to recipe_path(recipe_food_params[:recipe_id]), notice: 'Recipe food was successfully updated.'
        end

      else
        format.html { render :edit, status: :unprocessable_entity }

      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food.destroy
    respond_to do |format|
      format.html { redirect_to recipe_foods_url, notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_foods
    @foods = current_user.foods.map { |food| [food.name, food.id] }
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.fetch(:recipe_food, {}).permit(:food_id, :quantity, :recipe_id)
  end
end
