class CommentsController < ApplicationController 
  before_action :require_login 
  
  def create 
    @comment = Comment.new(comment_params) 

    if @comment.save 
      redirect_to post_url(params[:post_id]) 
    else
      flash[:errors] = @comment.errors.full_messages 
      render :new
    end 
  end 

  def new
    @comments = Comment.all
    render :new 
  end 

  def show 
    @comment = Comment.find_by(id: params[:id]) 
  end 

  private 

  def comment_params 
    params.require(:comment).permit(:content) 
  end 
end 
