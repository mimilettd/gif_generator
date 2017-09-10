class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Account successfully created!"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path, alert: "You don't have permission to access this page."
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
