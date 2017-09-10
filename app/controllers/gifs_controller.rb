class GifsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @grouped_gifs = @user.grouped_gifs.sort
    else
      @grouped_gifs = Gif.grouped_gifs.sort
    end
  end

  def create
    user = User.find(params[:user_id])
    gif = Gif.find(params["gif_id"])
    user.favorite(gif)
    redirect_to user_gifs_path
  end

  def destroy
    user = User.find(params[:user_id])
    gif = Gif.find(params[:id])
    user.unfavorite(gif)
    redirect_to user_gifs_path(user)
  end
end
