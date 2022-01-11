class Public::EvaluationsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @evaluation=Evaluation.new
  end

  def create
    @evaluation=Evaluation.new(evaluation_params)
    @evaluation.lesson_id=params[:evaluation][:lesson_id]
    @evaluation.customer_id=current_customer.id
    @evaluation.save
    redirect_to have_lessons_path
  end

  def show
    @evaluation=Evaluation.find(params[:id])
  end

  def index
    @evaluations=Evaluation.where(lesson_id: params[:lesson_id])
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:evaluation, :review)
  end

end
