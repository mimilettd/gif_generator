require 'rails_helper'

RSpec.feature "User visits main page" do
  before(:each) do
    setup
  end
  context "clicks login" do
    it "and can see favorited gifs" do
      visit '/'

      click_link 'Login'

      fill_in "session[email]", with: @user.email
      fill_in "session[password]", with: @user.password

      find('.action').first(:button, 'Login').click

      click_link 'Favorited Gifs'

      expect(current_path).to eq(user_gifs_path(@user))
      expect("Cat").to appear_before("Dog")
      expect(page).to have_css("img[src=\"#{@gif_5.image_path}\"]")
    end
  end
  context "does not login" do
    it "and should not see another user's favorited gifs" do
      user_2 = User.create(name: "Jake the Dog",
                           email: "jake@adventuretime.com",
                           password: "dog",
                           role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

      visit user_gifs_path(@user)

      expect(current_path).to eq(root_path)
    end
  end
end
