# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    authorize @category
  end

  def show
    @category = Category.find(params[:id])
    @category = @category.items
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    @category.save ? (redirect_to categories_path) : (render 'new')
  end

  def destroy
    @category = Category.find(params[:id])
    authorize @category
    @category.destroy

    redirect_to categories_path
  end

  def category_params
    params.require(:category).permit(:category)
  end
end
