class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]

  def index
  end

  def new
    @item=Item.new
    @genres=Genre.all
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      flash[:notice]="商品の新規登録が完了しました"
      redirect_to admin_item_path(@item)
    else
      flash[:alert]="商品詳細に不備があります"
      render :new
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
