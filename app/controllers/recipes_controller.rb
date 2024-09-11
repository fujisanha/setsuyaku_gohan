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
  
  def destroy
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:title, :body, details_attributes: [:id, :body, :_destroy], :details => [:name],
    recipe_items_attributes: [:id, :title, :body, :recipe_id, :details_id, :_destroy, ingredient_attributes: [:body]])
  end
end