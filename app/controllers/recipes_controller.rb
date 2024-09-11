class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @details = @recipe.details.build
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_path(@recipe.id)
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def confirm
  end
  
  private
  def recipe_params
    params.require(:recipe).permit(:name, details_attributes: [:id, :name, :_destroy])
  end
end
