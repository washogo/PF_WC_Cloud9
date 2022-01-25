class Admin::EvaluationsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @evaluation=Evaluation.find(params[:id])
  end

  def index
    @evaluations=Evaluation.where(lesson_id: params[:lesson_id])
  end

end
