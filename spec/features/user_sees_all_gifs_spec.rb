require 'rails_helper'

RSpec.feature "User visits gifs#index" do
  it "and can see all the gifs" do
    cat = Category.create(name: "cat")
    dog = Category.create(name: "dog")

    gif_1 = cat.gifs.create(search_term: "cat", image_path: "https://media3.giphy.com/media/vFKqnCdLPNOKc/200.gif")
    gif_2 = cat.gifs.create(search_term: "cat", image_path: "https://media3.giphy.com/media/1XG6PDYJbI4w0/giphy.gif")
    gif_3 = dog.gifs.create(search_term: "dog", image_path: "https://media2.giphy.com/media/3o7aCPVTaKjiYIPvsk/200.gif")

    user = User.create(name: "Princess Bubblegum",
                       email: "bubbglegum@adventuretime.com",
                       password: "candy",
                       role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit gifs_path

    expect(page).to have_css("img[src=\"#{gif_1.image_path}\"]")
    expect(page).to have_css("img[src=\"#{gif_2.image_path}\"]")
    expect(page).to have_css("img[src=\"#{gif_3.image_path}\"]")
  end
end
