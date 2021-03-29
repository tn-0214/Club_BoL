class ItemsController < ApplicationController

  def index
    @items = Item.order(created_at: "DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


private

  def items_params
    params.require(:item).permit(:name,:image,:gender_id,:category_id,:comment,:precaution,:lending_period_id,:due_date,:receiving_prefecture_id,:receiving_address,:weekly_price).merge(user_id: current_user.id)
  end

end


