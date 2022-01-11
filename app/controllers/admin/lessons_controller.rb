class Admin::LessonsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @lessons=Lesson.all
  end

  def show
    @lesson=Lesson.find(params[:id])
    @evaluations=Evaluation.where(lesson_id: @lesson.id)
  end

  def destroy
    @lesson=Lesson.find(params[:id])
    @lesson.destroy
    redirect_to admin_lessons_path
  end

end
