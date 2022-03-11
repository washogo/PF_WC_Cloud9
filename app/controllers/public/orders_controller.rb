class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order=Order.new
    @addresses=Address.where(customer_id: current_customer.id)
    @cart_lessons=CartLesson.where(customer_id: current_customer.id)
    if @cart_lessons.blank?
      flash[:alert]="カートが空です"
      redirect_to cart_lessons_path
    end
  end

  def confirmation
    @cart_lessons=CartLesson.where(customer_id: current_customer.id)
    @order=Order.new
    @order.address_id=params[:order][:address_id]
    @order.payment_method=params[:order][:payment_method]
    if params[:order][:address_id].blank?
      flash[:alert]="配送先情報が必要です"
      redirect_to new_order_path
    end
  end

  def completed
  end

  def create
    @order=Order.new(order_params)
    @order.customer_id=current_customer.id
    @order.shipping_fee=params[:order][:shipping_fee]
    @order.total_price=params[:order][:total_price]
    @order.address_id=params[:order][:address_id]
    @cart_lessons=CartLesson.where(customer_id: current_customer.id)

    if @order.save
      @cart_lessons.each do |cart_lesson|
        OrderDetail.create(order_id: @order.id, lesson_id: cart_lesson.lesson.id, price: cart_lesson.lesson.tax_price )
        HaveLesson.create(customer_id: current_customer.id, lesson_id: cart_lesson.lesson.id)
        @lesson=Lesson.find(cart_lesson.lesson.id)
        @customer=Customer.find(@lesson.customer.id)
        AnnounceMailer.with(lesson: @lesson, customer: @lesson.customer).send_mail.deliver
      end
      @cart_lessons.destroy_all
      redirect_to completed_orders_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:shipping_fee, :payment_method, :total_price, :order_status, :address_id)
  end

end
