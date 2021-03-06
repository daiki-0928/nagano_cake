class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!,except: [:top, :about, :index, :show]

  def index
   @items = Item.all.page(params[:page]).per(8)
   @all_items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
    @genres = Genre.all
  end

  def item_params
   params.require(:items).permit(:genre_id, :name, :introduction, :price, :image)
  end
end
