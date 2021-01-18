class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :move_to_index]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :concept, :category_id, :product_status_id, :shipping_charge_id, :shipping_day_id, :prefecture_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index if user_signed_in? && current_user.id != @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
