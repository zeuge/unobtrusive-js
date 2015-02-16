class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @item = Item.new
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Item was successfully created."
      @items = Item.all
    end
  end

  def edit

  end

  def update
    if @item.update(item_params)
      flash[:notice] = "Item was successfully updated."
      @item = Item.new
      @items = Item.all
    end
  end

  def destroy
    @item.destroy
    flash[:notice] = "Item was successfully destroyed."
    @items = Item.all
  end

private
  def item_params
    params.require(:item).permit(:name, :description)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
