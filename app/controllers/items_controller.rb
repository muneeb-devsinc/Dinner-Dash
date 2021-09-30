class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    authorize @item
    if @item.save
      redirect_to items_path
    else
      render 'new'
    end
  end

  def edit
    @item = Item.find(params[:id])
    authorize @item
  end

  def update
    @item = Item.find(params[:id])
    authorize @item
    if @item.update(item_params)
      redirect_to @item
    else
      render 'edit'
    end
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
    params.require(:item).permit(:title, :description, :price, :item_picture, :status, category_ids: [])
  end
end
