class ItemsController < ApplicationController
  
  def index
    @items = Item.all
    @item = Item.new    
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      flash[:notice] = "Successfully created item."
      @items = Item.all
    end
  end

private
  def items_params
    params.require(:item).permit(:name, :description)
  end
  
end
