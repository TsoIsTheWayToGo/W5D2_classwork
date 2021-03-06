class SubsController < ApplicationController 
  before_action :require_login 
  
  def create
    @sub = Sub.new(sub_params)  
    if @sub.save
      redirect_to subs_url #?
    else 
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def new
    @sub = Sub.new
    render :new
  end

  def index
    @subs = Sub.all
    render :index
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit  
  end

  def update
    @sub = Sub.find(params[:id])  
    if @sub.update(sub_params)
      redirect_to sub_url
    else 
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end 
