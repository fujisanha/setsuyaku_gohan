class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @details = @recipe.details.build
    @recipe_materials = @recipe.recipe_materials.build
    @submit_label = "投稿"
  end
  
  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:notice] = "created"
      redirect_to recipes_path
    else
      render :new
    end
  end

  def index
    @recipes = Recipe.all
    # あいまい検索:keywordがidとなる
    @recipes = @recipes.joins(:materials).where("materials.name LIKE ?", "%#{params[:keyword]}%") if params[:keyword].present?
    # uniqは重複を取り除くメソッド
    @recipes = @recipes.order(created_at: :desc).uniq if @recipes.any?
  end

  def show
    @recipe = Recipe.find(params[:id])
    @details = @recipe.details
    @recipe_materials = @recipe.recipe_materials
    @user = @recipe.user
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @submit_label = "更新"
    unless current_user.id == @recipe.user_id
      flash[:alert] = "this recipe cannot be edited"
      redirect_to recipes_path
    end
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:notice] = "updated"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def confirm
    @recipe = Recipe.find(params[:id])
  end
  
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    flash[:notice] = "deleted"
    redirect_to recipes_path
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