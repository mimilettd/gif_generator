require 'rails_helper'

RSpec.feature "User visits gifs#new" do
  context "as admin" do
    it "they can generate gifs" do

      admin = User.create(name: "Princess Bubblegum",
                          email: "bubbglegum@adventuretime.com",
                          password: "candy",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit '/'

      click_on 'Generate a new GIF'

      expect(current_path).to eq(new_admin_gif_path)
      expect(page).to have_content("Generate Gifs")
    end
  end
  context "as user" do
    it "they cannot see link to generate gifs" do
      user = User.create(name: "Princess Bubblegum",
                         email: "bubbglegum@adventuretime.com",
                         password: "candy",
                         role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'
      save_and_open_page

      expect(page).to_not have_content("Generate Gifs")
    end
  end
end
