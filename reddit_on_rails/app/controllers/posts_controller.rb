class PostsController < ApplicationController
  def new 
    @subs = Sub.all 
    render :new 
  end 

  def show 
    @post = Post.find(params[:id])
    render :show
  end

  def create 
    @post = Post.new(post_params) 

    if @post.save 
      # params[:sub_ids].each { |sub_id| PostSub.create(post_id: @post.id, sub_id: sub_id) } 
      redirect_to posts_url 
    else 
    end
  end 
  
  def edit 
    post = Post.find_by(params[:title]) 
    render :edit 
  end 
  
  def update 
    post = Post.find_by(params[:title])

    if post.save 
      redirect_to #?
    else 
      flash[:errors] = post.errors.full_messages 
      render :edit 
    end 
  end 

  private 

  def post_params
    params.require(:post).permit(:title, sub_ids: []) 
  end 
end
