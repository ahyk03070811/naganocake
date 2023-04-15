class Public::CustomersController < ApplicationController
  def show
    @customer=current_customer
  end

  def edit
    @customer=Cistomer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "個人情報を編集しました"
      redirect_to customers_may_page(current_customer.id)
    else
      flash[:danger] = "個人情報の編集に失敗しました"
      render :edit
    end
  end

  def withdraw
    current_customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :telephone_number, :postal_code, :address, :is_deleted)
  end


end
