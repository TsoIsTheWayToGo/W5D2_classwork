class SessionsController < ApplicationController
  def new
    @user = User.new 
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      login!
      redirect_to #?
    else
      render :new
    end
  end

  def destroy
    logout!
    redirect_to #?
  end
end
