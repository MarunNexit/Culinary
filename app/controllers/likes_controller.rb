class LikesController < ApplicationController


  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_user.likes.create(recipe: @recipe)

  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    current_user.likes.find_by(recipe: @recipe).destroy

  end
end
