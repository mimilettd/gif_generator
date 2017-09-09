class GifsController < ApplicationController
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      @gifs = user.gifs
    else
      @gifs = Gif.all
    end
  end

  def create
    favorite = Favorite.new(user_id: params["user_id"], gif_id: params["gif_id"])
    user = favorite.user
    if favorite.save
      redirect_to user_gifs_path(user)
    else
      redirect_to gifs_index
    end
  end
end
