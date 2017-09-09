require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before(:each) do
    category = Category.create(name: "cat")

    gif = Gif.create(search_term: "cat",
                     image_path: "https://media3.giphy.com/media/vFKqnCdLPNOKc/200.gif",
                     category_id: category.id)

    user = User.create(name: "Princess Bubblegum",
                       email: "bubbglegum@adventuretime.com",
                       password: "candy",
                       role: 0)

    @favorite = Favorite.new(user_id: user.id,
                             gif_id: gif.id)

  end
  it "is valid with valid attributes" do
    expect(@favorite).to be_valid
  end
  it "is not valid without a user" do
    @favorite.user_id = nil
    expect(@favorite).to_not be_valid
  end
  it "is not valid without a gif" do
    @favorite.gif_id = nil
    expect(@favorite).to_not be_valid
  end
end
