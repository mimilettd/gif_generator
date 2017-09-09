require 'rails_helper'

RSpec.feature "User visits gifs#index" do
  it "and can favorite gifs" do
    category = Category.create(name: "cat")
    gif = Gif.create(search_term: "cat",
                     image_path: "https://media3.giphy.com/media/vFKqnCdLPNOKc/200.gif",
                     category_id: category.id)

    user = User.create(name: "Princess Bubblegum",
                       email: "bubbglegum@adventuretime.com",
                       password: "candy",
                       role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit gifs_path

    # within ".gif-1" do
    #   first(:link, "Favorite").click
    # end

    find(".favorite-1").click

    expect(current_path).to eq(user_gifs_path(user))
    expect(page).to have_css("img[src=\"#{gif.image_path}\"]")
  end
end
