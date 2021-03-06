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

      click_on 'Generate a GIF'

      expect(current_path).to eq(new_admin_gif_path)
      expect(page).to have_content("Generate Gifs")

      fill_in "gif[search_term]", with: "cat"
      click_on "Generate GIF"

      expect(current_path).to eq(gifs_path)
    end
  end
  context "as user" do
    it "they cannot see link to generate gifs" do
      user

      visit '/'

      expect(page).to_not have_content("Generate Gifs")
    end
    it "they cannot access page even with link" do
      user

      visit new_admin_gif_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
