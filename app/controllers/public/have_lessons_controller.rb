class Public::HaveLessonsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @have_lessons=HaveLesson.where(customer_id: current_customer)
  end
  
  def show
  end
  
end
