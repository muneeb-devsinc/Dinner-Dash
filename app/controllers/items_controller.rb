# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = if params[:q]
               Item.search(params[:q]).result
             else
               Item.includes(%i[items_categories categories]).with_attached_picture.sorted_by_title
             end.page(params[:page]).per(5)
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    authorize @item
    if @item.save
      flash[:notice] = 'Item Created Successfully'
      (redirect_to items_path)
    else
      render 'new'
    end
  end

  def edit
    authorize item
  end

  def update
    authorize item
    if @item.update(item_params)
      flash[:notice] = 'Item Updated Successfully'
      (redirect_to @item)
    else
      render 'edit'
    end
  end

  def show
    item
  end

  def destroy
    authorize item
    flash[:alert] = if @item.destroy
                      'Item Removed'
                    else
                      'Item Could Not Be Removed'
                    end
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :picture, :status, :q, category_ids: [])
  end

  def item
    @item ||= Item.find(params[:id])
  end
end
