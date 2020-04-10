class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @item = Item.new
    @item.images.new
    @user = @item.user
    @place = Place.find_by(@user)
  end
  
  def create
    @item = Item.new(item_params)
    if 
      @item.save
      @item.errors.messages
      redirect_to root_path  notice: "出品が完了しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
    # @images = Image.where(item_id: @item.id)
    @images = @item.images
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path, notice: '商品情報の編集が完了しました'
    else
      render :edit, notice: '商品情報の編集ができません'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path, notice: '商品情報を削除しました'
  end

  private
      
  def item_params
    params.require(:item).permit(:name, :description, :status, :size, :cost, :days, :price, :category_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end
end
