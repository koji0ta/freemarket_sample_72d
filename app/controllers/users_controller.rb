class UsersController < ApplicationController
  before_action :contents_listing, only: [:index, :edit, :show]

  def index
  end

  def edit
  end

  def update
  end
0
  private

  def contents_listing
    @contents = ["メール/パスワード", "住所", "クレジットカード", "出品商品一覧"]
    @links = []
  end
end
