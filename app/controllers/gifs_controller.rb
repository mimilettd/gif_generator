class GifsController < ApplicationController
  def index
    @gifs = Gif.all
  end

  def create
  end
end
