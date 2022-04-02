class Public::PaymentMethodsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @payment_method = PaymentMethod.new
    @payment_methods = PaymentMethod.where(customer_id: current_customer.id)
  end

  def create
    if params[:payment_method].present?
      @payment_method = PaymentMethod.new(payment_method_params)
      @payment_method.customer_id = current_customer.id
      @payment_method.save
      redirect_to payment_methods_path
    else
      flash.now[:alert] = "１つ以上選択してください" 
      render :index
    end
  end

  def destroy
    @payment_method = PaymentMethod.find(params[:id])
    @payment_method.destroy
    redirect_to payment_methods_path
  end

  private
  def payment_method_params
    params.require(:payment_method).permit(:method)
  end

end
