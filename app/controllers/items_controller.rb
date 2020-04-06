class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if 
      # binding.pry
      @item.save
      @item.errors.messages
      redirect_to root_path  notice: "出品が完了しました"
    else
      render :new
    end
  end

  private
    
  def item_params
    params.require(:item).permit(:name,:description,:status,:size,:cost,:days,:price, images_attributes: [:image])
  end

end