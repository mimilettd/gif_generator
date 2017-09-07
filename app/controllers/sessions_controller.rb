class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome back, #{@user.name}!"
      redirect_to user_path(@user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end
end
