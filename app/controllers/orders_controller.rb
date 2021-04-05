class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
   before_action :move_to_root

  def index
    @order = Order.new
    gon.daily_price = @item.daily_price
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

private
  def order_params
    params.require(:order).permit(:lending_period).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_root
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
