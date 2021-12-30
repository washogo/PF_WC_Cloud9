class Public::LessonsController < ApplicationController
  def new
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
