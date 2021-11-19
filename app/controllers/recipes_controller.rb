class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe, only: %i[show destroy]

  def index
    @recipes = current_user.recipes
  end

  def public
    @recipes = Recipe.all
  end

  def show
    @foods = Food.all
    @food = @recipe.foods.new
    @recipe = Recipe.find(params[:id])
  end

  def new
    @food_recipe = RecipeFood.new
  end


  def generate_list; end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    respond_to do |format|
      if @recipe.save
        flash[:success] = 'The recipe item was added succesfully'
        format.html { redirect_to root_url, notice: 'The recipe item was added succesfully' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
        flash[:alert] = "The item couldn't be created."
      end
    end
  end

  def destroy
    @recipe.delete
    respond_to do |format|
      flash[:success] = 'The item was succesfully destroyed'
      format.html { redirect_to root_url, notice: 'The item was succesfully destroyed' }
      format.json { head :no_content }
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.fetch(:recipe, {}).permit(:name, :preparation_time, :cooking_time, :description)
  end


end
