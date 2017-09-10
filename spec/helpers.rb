module Helpers
  def setup
    @cat = Category.create(name: "cat")
    @dog = Category.create(name: "dog")
    @dolphin = Category.create(name: "dolphin")
    @unicorn = Category.create(name: "unicorn")

    @gif_3 = @cat.gifs.create(search_term: "cat", image_path: "https://media3.giphy.com/media/vFKqnCdLPNOKc/200.gif")
    @gif_4 = @cat.gifs.create(search_term: "cat", image_path: "https://media3.giphy.com/media/1XG6PDYJbI4w0/giphy.gif")
    @gif_5 = @dog.gifs.create(search_term: "dog", image_path: "https://media2.giphy.com/media/3o7aCPVTaKjiYIPvsk/200.gif")
    @gif_2 = @dolphin.gifs.create(search_term: "dolphin", image_path: "https://media3.giphy.com/media/cRq8TJsIKmQRG/giphy.gif")
    @gif_1 = @unicorn.gifs.create(search_term: "unicorn", image_path: "https://media1.giphy.com/media/zyvX4znjfNqdG/giphy.gif")

    @user = User.create(name: "Princess Bubblegum",
                       email: "bubbglegum@adventuretime.com",
                       password: "candy",
                       role: 0)

    gifs = [@gif_1, @gif_2, @gif_3, @gif_4, @gif_5]

    gifs.each do |gif|
      @user.favorite(gif)
    end
  end
  def user
    @user = User.create(name: "Princess Bubblegum",
                       email: "bubbglegum@adventuretime.com",
                       password: "candy",
                       role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
end
