class Public::HaveLessonsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @have_lessons=HaveLesson.where(customer_id: current_customer)
  end

  def show
    @have_lesson=HaveLesson.find(params[:id])
    @cart_lesson=CartLesson.new
  end

  def update
    @have_lesson=HaveLesson.find(params[:id])
    @have_lesson.update(have_lesson_params)
    redirect_to have_lessons_path
  end

  private
  
  def have_lesson_params
    params.require(:have_lesson).permit(:progress, :is_in_study)
  end

end
