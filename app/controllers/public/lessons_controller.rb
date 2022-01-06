class Public::LessonsController < ApplicationController
  before_action :authenticate_customer!
  def new
    @lesson=Lesson.new
    @categories=Category.all
  end

  def create
    @lesson=Lesson.new(lesson_params)
    @lesson.save!
    redirect_to lessons_path
  end

  def show
  end

  def index
    @lessons = Lesson.all
  end

  def edit
  end

  def update
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :content, :attending_style, :contract_period, :price, :access, :is_in_lecture, :category_id)
  end
end
