class ItemsController < ApplicationController
  def index
  end
  
  def new
    @categories = Category.where(ancestry: nil)
    @category_parent_array = Category.where(ancestry: nil).pluck(:id,:name)
    @item = Item.new
    @item.images.new
    
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def get_category_children
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
    end
  end
  
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end
  
  def search
      redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shippingpayer_id, :postage_id, :shipping_day_id, :price, images_attributes: [:image_url, :_destroy, :id]).merge(user_id: current_user.id).merge(seller_id: current_user.id)
  end
  
end
