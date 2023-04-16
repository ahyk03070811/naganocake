class Public::AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses.page(params[:page]).per(3)
  	@address = Address.new
  end

  def edit
  end
end
