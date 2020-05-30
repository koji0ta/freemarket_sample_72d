class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_parent_category, only: [:new, :create]

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
  end

  def show
    @user = @item.user
    @third_category = Category.find(@item.category_id)
    @second_category = @third_category.parent
    @first_category = @second_category.parent
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

      grandchild_category = @item.category
      child_category = grandchild_category.parent

      @category_parent_array = Category.where(ancestry: nil)
      @category_children_array = Category.where(ancestry: child_category.ancestry)
      @category_grandchildren_array = Category.where(ancestry: grandchild_category.ancestry)

    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id]), notice: '商品情報の編集が完了しました'
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
  
  #jbuilder用メソッド
  def get_category_children
    @category_children = Category.find("#{params[:parent_id]}").children
  end
  
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :description, :status, :size, :cost, :days, :price, :category_id, images_attributes: [:src, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def set_parent_category
    @categories = Category.where(ancestry: nil)
  end
  
end
