class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe created successfully!'
    else
      render :new
    end
  end


  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :html_details, :image, :text, :user_id)
  end
end