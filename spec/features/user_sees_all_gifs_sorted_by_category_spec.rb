require 'rails_helper'

RSpec.feature "User visits category#index" do
  it "and should see gifs sorted by category" do
    cat = Category.create(name: "cat")
    dog = Category.create(name: "dog")
    dolphin = Category.create(name: "dolphin")
    unicorn = Category.create(name: "unicorn")

    gif_1 = cat.gifs.create(search_term: "cat", image_path: "https://media3.giphy.com/media/vFKqnCdLPNOKc/200.gif")
    gif_2 = cat.gifs.create(search_term: "cat", image_path: "https://media3.giphy.com/media/1XG6PDYJbI4w0/giphy.gif")
    gif_3 = dog.gifs.create(search_term: "dog", image_path: "https://media2.giphy.com/media/3o7aCPVTaKjiYIPvsk/200.gif")

    user = User.create(name: "Princess Bubblegum",
                       email: "bubbglegum@adventuretime.com",
                       password: "candy",
                       role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit categories_path

    expect("cat").to appear_before("dog")
    expect("dog").to appear_before("dolphin")
    expect("unicorn").to_not appear_before("cat")
  end
end
