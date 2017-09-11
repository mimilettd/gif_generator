class GifsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      check_user
    else
      @grouped_gifs = Gif.grouped_gifs.sort
    end
  end

  def create
    user = User.find(params[:user_id])
    gif = Gif.find(params["gif_id"])
    user.favorite(gif)
    flash[:success] = "Gif successfully favorited!"
    redirect_to gifs_index
  end

  def destroy
    user = User.find(params[:user_id])
    gif = Gif.find(params[:id])
    user.unfavorite(gif)
    redirect_to user_gifs_path(user)
  end

  private

  def check_user
    if current_user != @user
      redirect_to root_path, alert: "You don't have permission to access this page."
    else
      @grouped_gifs = @user.grouped_gifs.sort
    end
  end
end
