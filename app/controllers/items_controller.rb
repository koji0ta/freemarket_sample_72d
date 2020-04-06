class ItemsController < ApplicationController
  
  def index
  end

  def new
  end
  
end
  def show
    @item = Item.find(params[:id])
  end

end
