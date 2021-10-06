# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[edit update show destroy]
  def index
    @items = if params[:q]
               Item.ransack(params[:q]).result
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
    authorize @item
  end

  def update
    authorize @item
    if @item.update!(item_params)
      flash[:notice] = 'Item Updated Successfully'
      (redirect_to @item)
    else
      render 'edit'
    end
  end

  def show
    @item
  end

  def destroy
    authorize @item
    if @item.destroy!
      flash[:notice] = 'Item Removed'
    else
      flash[:alert] = 'Item Could Not Be Removed'
    end
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :picture, :status, :q, category_ids: [])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
