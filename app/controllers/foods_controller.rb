class FoodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_food, only: %i[show destroy]

  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
    @measurement_units = %w[grams kilograms]
  end

  def create
    # @food = current_user.foods.new(food_params)
    @food = current_user.foods.new(food_params)
    respond_to do |format|
      if @food.save
        flash[:success] = 'The food item was added succesfully'
        format.html { redirect_to root_url, notice: 'The food item was added succesfully' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
        flash[:alert] = "The item couldn't be created."
      end
    end
  end

  def destroy
    @food.destroy
    respond_to do |format|
      flash[:success] = 'The item was succesfully destroyed'
      format.html { redirect_to root_url, notice: 'The item was succesfully destroyed' }
      format.json { head :no_content }
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.fetch(:food, {}).permit(:name, :measurement_unit, :price)
  end
end
