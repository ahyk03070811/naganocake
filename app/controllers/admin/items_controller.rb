class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!,only: [:create,:edit,:update,:index, :show, :new]

  def index
    @items=Item.page(params[:page])
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
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end
  
  def update
    @item=Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice]="商品詳細の変更が完了しました"
      redirect_to admin_item_path(@item)
    else
      flash[:alert]="変更内容に不備があります"
      render :edit
    end
  end



  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :image, :is_active)
  end

end
