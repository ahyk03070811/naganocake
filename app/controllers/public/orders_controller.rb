class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
		@customer = current_customer
		@addresses = ShippingAddress.where(customer_id: current_customer.id)
  end
  
  def create
		customer = current_customer

		session[:order] = Order.new

		cart_items = current_customer.cart_items

		sum = 0
		cart_items.each do |cart_item|
			sum += (cart_item.item.price * 1.1).floor * cart_item.amount
		end

		session[:order][:shipping_cost] = 800
		session[:order][:total_payment] = sum + session[:order][:shipping_cost]
		session[:order][:status] = 0
		session[:order][:customer_id] = current_customer.id
		session[:order][:payment_method] = params[:method].to_i

		destination = params[:a_method].to_i

		if destination == 0

			session[:order][:postal_code] = customer.postal_code
			session[:order][:address] = customer.address
			session[:order][:name] = customer.last_name + customer.first_name


		elsif destination == 1

			address = ShippingAddress.find(params[:shipping_address_for_order])
			session[:order][:postal_code] = address.postal_code
			session[:order][:address] = address.address
			session[:order][:name] = address.name 

		
		elsif destination == 2

			session[:new_address] = 2
			session[:order][:postal_code] = params[:postal_code]
			session[:order][:address] = params[:address]
			session[:order][:name] = params[:name]

		end
		
		if session[:order][:postal_code].presence && session[:order][:address].presence && session[:order][:name].presence
			redirect_to orders_new_path
		else
			redirect_to orders_path
		end

  end

  def comfirm
  	@cart_items = current_customer.cart_items
  end

  def complete
  end

  def index
  	@orders=current_customer.orders
  end

  def show
  	@order=Order.find(params[:id])
  	@order_details=@order.order_details
  end
end
