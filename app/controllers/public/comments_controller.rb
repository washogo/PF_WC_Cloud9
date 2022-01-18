class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @comment=Comment.new
  end

  def create
    @comment=Comment.new(comment_params)
    @comment.customer_id=current_customer.id
    @comment.save
    redirect_to comments_path
  end

  def index
    @comments=Comment.all
    @reply_comment=ReplyComment.new
  end

  def edit
    @comment=Comment.find(params[:id])
  end

  def update
    @comment=Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to comments_path
  end

  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
