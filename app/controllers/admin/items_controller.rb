class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]

  def index
  end

  def new
    @item=Item.new
  end

  def show
  end

  def edit
  end
  
  
  
  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :image, :is_active)
  end
  
end
