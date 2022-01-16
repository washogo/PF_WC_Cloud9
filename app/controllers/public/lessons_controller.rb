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
    redirect_to customer_path(current_customer.id)
  end

  def show
    @lesson=Lesson.find(params[:id])
    @cart_lesson=CartLesson.new
    @evaluations=Evaluation.where(lesson_id: @lesson.id)
  end

  def index
    @lessons=Lesson.where.not(customer_id: current_customer.id)
  end

  def edit
    @lesson=Lesson.find(params[:id])
    @categories=Category.all
    # @tag_lists=TagLists.where(lesson_id: @lesson.id)
  end

  def update
    @lesson=Lesson.find(params[:id])
    tag_list=params[:lesson][:tags][:name].split(',')
    @lesson.update(lesson_params)
    @lesson.save_tag(tag_list)
    redirect_to customer_path(current_customer.id)
  end

  def destroy
    @lesson=Lesson.find(params[:id])
    @lesson.destroy
    redirect_to customer_path(current_customer.id)
  end

  def search
    @categories=Category.all
    @tags=Tag.all
  end

  def result
    @lessons=Lesson.none
    @tag_lists=TagList.none
    tag_ids=params[:search][:tags].select(&:present?)

    tag_ids.each do |tag_id|
      @tag_lists=@tag_lists.or(TagList.where(tag_id: tag_id))
    end

    @tag_lists.each do |tag_list|
      @lessons=@lessons.or(Lesson.where(id: tag_list.lesson.id))
    end

    @search_params = lesson_search_params
    @lessons = @lessons.search(@search_params)

  end

  private

  def lesson_search_params
    params.fetch(:search, {}).permit(:category_id, :attending_style, :access, :price)
  end

  def lesson_params
    params.require(:lesson).permit(:name, :content, :attending_style, :contract_period, :price, :access, :is_in_lecture, :category_id)
  end
  
end
