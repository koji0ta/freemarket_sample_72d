class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @item = Item.new
    @item.images.new
    @place = Place.find_by(user_id: current_user.id)
  end
  
  def create
    @item = Item.new(item_params)
    @item.whether_sale = true
    @place = Place.find_by(user_id: current_user.id)
    if @item.save
      redirect_to root_path
    else
      @item.images.new
      render :new
    end
    # revertテスト用の記述です(見つけたら削除して下さい)
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
    @category = Category.find(@item.category_id)
    @images = @item.images

    @status = Status.find(@item.status)
    @size = Size.find(@item.size)
    @cost = Cost.find(@item.cost)
    @days = Days.find(@item.days)
  end

  def edit
    @place = Place.find_by(user_id: current_user.id)
    if user_signed_in? && current_user.id == @item.user_id
      @images = @item.images
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to user_path(current_user.id), notice: '商品情報の編集が完了しました'
    else
      render :edit, notice: '商品情報の編集ができません'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: '商品情報を削除しました'
    else
      render :edit, notice: '商品情報が削除できませんでした'
    end
  end

  private
      
  def item_params
    params.require(:item).permit(:name, :description, :status, :size, :cost, :days, :price, :category_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
