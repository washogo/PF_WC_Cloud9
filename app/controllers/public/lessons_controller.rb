class Public::LessonsController < ApplicationController
  before_action :authenticate_customer!
  def new
    @lesson=Lesson.new
    @categories=Category.all
  end

  def create
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
end
