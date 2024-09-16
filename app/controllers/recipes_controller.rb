class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @details = @recipe.details.build
    @recipe_materials = @recipe.recipe_materials.build
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
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @details = @recipe.details
    @recipe_materials = @recipe.recipe_materials
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  def confirm
  end
  
  def destroy
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image,
    recipe_materials_attributes: [:id, :saving_size, :unit, :material_id, :material_name, :_destroy],
    details_attributes: [:id, :body, :image, :_destroy],
    :details => [:name],
    recipe_items_attributes: [:id, :title, :body, :image, :recipe_id, :details_id, :_destroy, ingredient_attributes: [:body]])
  end
end