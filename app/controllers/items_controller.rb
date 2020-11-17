class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :product_discription, :category_id, :status_id, :shipping_fee_id, :shipping_prefecture_id, :scheduled_delivery, :price, :image).merge(user_id: current_user.id)  
  end
end
