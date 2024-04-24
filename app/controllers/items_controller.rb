class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if item.user_id == current_user.id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :product, :seller_comment, :category_id, :condition_id, :postage_type_id, :region_id, :shopping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to new_user_session_path
    end
  end
end