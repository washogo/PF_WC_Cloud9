class Public::ReplyCommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @reply_comment=ReplyComment.new(reply_comment_params)
    @reply_comment.save
    redirect_to comments_path
  end
  
  def destroy
    @reply_comment=ReplyComment.find(params[:id])
    @reply_comment.destroy
    redirect_to comments_path
  end

  private

  def reply_comment_params
    params.require(:reply_comment).permit(:content, :comment_id, :customer_id)
  end

end

