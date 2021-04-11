class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ,:itemlist, :searchbranch, :search_legion,:search_category]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
 

  def index
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

  def show
    minimum = MinimumPeriod.data.detect{|o| o[:id] == @item.minimum_period}
    @minimum_p_name = minimum[:name]
  end

  def edit
  end

  def update
    if @item.update(items_params)
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

  def itemlist
    @items = Item.order(created_at: "DESC")
  end

  def search_legion
    @users = User.includes(:items).where(prefecture_code: params[:search_pref])
    @users = @users.where(address_city: params[:search_city]) if params[:search_city].present?
    @items = @users.flat_map(&:items)
  end

  def search_category
    @items = Category.includes(:items).where(id: params[:category_ids]).flat_map(&:items)
  end

  def searchbranch
  end


private

  def items_params
    params.require(:item).permit(:name,:image,:comment,:precaution,:gender_id,:due_date,:minimum_period,:daily_price,category_ids: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


end


