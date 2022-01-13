class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except:[:show]

  def unique
    @customer=current_customer
  end

  def show
    @customer=Customer.find(params[:id])
    @have_lessons=HaveLesson.where(customer_id: @customer.id)
    @lessons=Lesson.where(customer_id: @customer.id)
  end

  def personal
    @customer=current_customer
  end

  def transfer
    @customer=current_customer
  end

  def update
    @customer=current_customer
    @customer.update(customer_params)
    redirect_to customer_path(current_customer)
  end

  def cancel
    @customer=current_customer
  end

  def quit
    @customer=current_customer
    @customer.is_deleted=params[:customer][:is_deleted]
    @customer.update(customer_params)
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :nickname, :profile, :image, :transfer_target, :is_deleted)
  end


end
