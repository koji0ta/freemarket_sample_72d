class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    if 
      binding.pry
      @item.save
      @item.errors.messages
      redirect_to root_path  notice: "出品が完了しました"
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private
    
  def item_params
    params.require(:item).permit(:name,:description,:status,:size,:cost,:days,:price,:category_id, images_attributes: [:image])
  end

end