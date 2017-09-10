class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name)
  end

  def show
    @category = Category.find(params[:id])
    @gifs = @category.gifs
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to categories_path
  end
end
