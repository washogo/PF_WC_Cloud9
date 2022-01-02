class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except:[:show]

  def unique
    @customer=current_customer
  end

  def show
    @correct_customer=current_customer
    @customer=Customer.find(params[:id])
  end

  def personal
  end

  def transfer
  end

  def update
    @customer=current_customer
    @customer.update(customer_params)
    redirect_to current_customer_mine_path
  end

  def cancel
  end

  def quit
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :nickname, :profile, :image)
  end


end
