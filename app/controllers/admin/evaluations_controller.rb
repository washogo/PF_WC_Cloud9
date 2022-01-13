class Admin::EvaluationsController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @evaluation=Evaluation.find(params[:id])
  end
  
  def index
    @evaluations=Evaluation.all
  end
  
end
