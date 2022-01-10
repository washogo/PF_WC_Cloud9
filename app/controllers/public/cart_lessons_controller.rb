class Public::CartLessonsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @cart_lesson=CartLesson.new
    @cart_lesson.lesson_id=params[:cart_lesson][:lesson_id]
    @cart_lesson.customer=current_customer
    @cart_lesson.save
    redirect_to cart_lessons_path
  end

  def index
    @cart_lessons=CartLesson.all
  end

  def destroy
    @cart_lesson=CartLesson.find(params[:id])
    @cart_lesson.destroy
    redirect_to cart_lessons_path
  end

end
