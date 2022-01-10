class Public::LessonsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @lesson=Lesson.new
    @lesson.customer_id=current_customer.id
    @categories=Category.all
  end

  def create
    @lesson=Lesson.new(lesson_params)
    @lesson.customer_id=current_customer.id
    tag_list=params[:lesson][:tags][:name].split(',')
    @lesson.save
    @lesson.save_tag(tag_list)
    redirect_to lessons_path
  end

  def show
    @lesson=Lesson.find(params[:id])
  end

  def index
    @lessons=Lesson.all
  end

  def edit
    @lesson=Lesson.find(params[:id])
    @categories=Category.all
  end

  def update
    @lesson=Lesson.find(params[:id])
    tag_list=params[:lesson][:tags][:name].split(',')
    @lesson.save(lesson_params)
    @lesson.save_tag(tag_list)
    redirect_to lesson_path(@lesson)
  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :content, :attending_style, :contract_period, :price, :access, :is_in_lecture, :category_id)
  end
end
