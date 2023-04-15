class Public::AddressesController < ApplicationController
  def index
    @addresses = current_member.addresses.page(params[:page]).per(3)
  	@address = Address.new
  end

  def edit
  end
end
