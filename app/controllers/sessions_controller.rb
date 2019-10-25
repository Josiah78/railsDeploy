class SessionsController < ApplicationController
  skip_before_action :check, only: [:create, :new]
  def new
  end

  def create
    user = User.find_by(email:login_params[:email])
    if user && user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to '/ideas'
    else
      flash[:errors] = ["Email or Password is Incorrect"]
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private
    def login_params
      params.require(:login).permit(:email, :password)
    end
end