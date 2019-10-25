class UsersController < ApplicationController
    skip_before_action :check, only: [:create]
    def create
      user = User.create(user_params)
      if user.valid?
        session[:user_id] = user.id
        redirect_to '/ideas'
      else
        flash[:errors] = user.errors.full_messages
        redirect_to '/'
      end
    end
  
    def show
      @user = User.find(params[:user_id])
    end
  
    private 
      def user_params
        params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
      end
end