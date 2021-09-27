class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    session[:order_id]=4
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @category = @category.items
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  def category_params
    params.require(:category).permit(:category)
  end
end
