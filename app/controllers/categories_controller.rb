# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show destroy]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    authorize @category
  end

  def show
    @category_items = @category.items.includes(%i[items_categories categories]).with_attached_picture.sorted_by_title
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    if @category.save!
      flash[:notice] = 'Category Created'
      (redirect_to categories_path)
    else
      render 'new'
    end
  end

  def destroy
    authorize @category
    if @category.destroy!
      flash[:notice] = 'Category Removed'
    else
      flash[:alert] = 'Category Could Not Be Removed'
    end
    redirect_to categories_path
  end

  private

  def category_params
    params.permit(:id, :category)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
