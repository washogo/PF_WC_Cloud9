class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!, except:[:index]

  def new
    @comment=Comment.new
  end

  def create
    @comment=Comment.new(comment_params)
    @comment.customer_id=current_customer.id
    @comment.save
    if params[:comment][:id].present?
      ReplyRelationship.create(main_comment_id: params[:comment][:id], reply_id: @comment.id)
      redirect_to comment_path(params[:comment][:id])
    else
      redirect_to comments_path
    end
  end

  def index
    @reply_relationships=ReplyRelationship.all
    @comments=Comment.all
    @comment=Comment.new
  end

  def show
    @main_comment=Comment.find(params[:id])
    @comment=Comment.new
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
    
    if @comment.replying.present?
      id=@comment.replying.id
      @comment.destroy
      redirect_to comment_path(id)
    else
      @comment.destroy
      redirect_to comments_path
    end
    
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
