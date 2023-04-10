class Admin::HomesController < ApplicationController
  def top
    @orders=Order.where("created_at"===Date.today)
    @order=Order.page(params[:page]).reverse_order
  end
end
