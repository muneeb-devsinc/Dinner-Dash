# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = params[:q] ? Item.ransack(params[:q]).result : Item.all
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    authorize @item
    @item.save ? (redirect_to items_path) : (render 'new')
  end

  def edit
    @item = Item.find(params[:id])
    authorize @item
  end

  def update
    @item = Item.find(params[:id])
    authorize @item
    @item.update(item_params) ? (redirect_to @item) : (render 'edit')
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    authorize @item
    @item.destroy

    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :item_picture, :status, :q, category_ids: [])
  end
end
