require 'rails_helper'

RSpec.describe "Guest logs into existing account" do
  context "Guest visits welcome#index" do
    before(:each) do
      User.create(name: "Jake the Dog",
                  email: "jake@adventuretime.com",
                  password: "dog")

      visit '/'

      click_link 'Login'

    end
    it "and fills out email and password to login" do
      fill_in "session[email]", with: "jake@adventuretime.com"
      fill_in "session[password]", with: "dog"

      click_on 'Login'

      expect(page).to have_content("Welcome, #{User.last.name}!")
    end
    it "and inputs incorrect password" do
      fill_in "session[email]", with: "jake@adventuretime.com"
      fill_in "session[password]", with: "cat"

      click_on 'Login'

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid email/password combination")
    end
    it "and inputs incorrect email" do
      fill_in "session[email]", with: "lumpyspaceprincess@adventuretime.com"
      fill_in "session[password]", with: "dog"

      click_on 'Login'

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Invalid email/password combination")
    end
  end
end
