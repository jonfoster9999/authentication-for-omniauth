class SessionsController < ApplicationController
  before_action :redirect_home, except: :logout

  def new
  end

  def create
    ## find the person, see if they authenticate and if so log them in
    @user = User.find_by(:email => params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      ## authentication failed
      flash[:notice] = "Authentication Failed"
      render :new
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end
end
