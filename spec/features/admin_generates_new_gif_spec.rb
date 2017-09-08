require 'rails_helper'

RSpec.feature "User visits gifs#new" do
  context "as admin" do
    it "they can generate gifs" do
      admin = User.create(name: "Princess Bubblegum",
                          email: "bubbglegum@adventuretime.com",
                          password: "candy",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_gif_path
      expect(page).to have_content("Generate New Gif")

      fill
    end
  end
end
