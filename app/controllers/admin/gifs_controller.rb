require 'net/http'
require 'json'

class Admin::GifsController < Admin::BaseController
  def new
    @gif = Gif.new
  end

  def create
    search_term = gif_params[:search_term]
    url = "http://api.giphy.com/v1/gifs/random?tag=#{search_term}&api_key=059e59d366d2411e94374ac6bbf0f75f&limit=5"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
    image_path = result["data"]["image_url"]
    category = Category.find_or_create_by(name: search_term)
    @gif = Gif.create(search_term: search_term, image_path: image_path, category_id: category.id)
    redirect_to gifs_path
  end

  private
  def gif_params
    params.require(:gif).permit(:search_term, :image_path)
  end
end
