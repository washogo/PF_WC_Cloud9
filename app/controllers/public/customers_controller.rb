class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except:[:show]

  def profile
    @customer=current_customer
  end

  def show
    @customer=Customer.find(params[:id])
    @have_lessons=HaveLesson.where(customer_id: @customer.id)
    @lessons=Lesson.where(customer_id: @customer.id)
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
    params.require(:customer).permit(:nickname, :profile, :image, :is_deleted)
  end


end
