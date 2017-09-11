require 'rails_helper'

RSpec.describe "Guest creates a new account" do
  context "Guest visits welcome#index" do
    before(:each) do
      visit '/'

      click_link 'Sign Up'
    end
    it "and fills out form to create new account" do
      fill_in "user[name]", with: "Jake the Dog"
      fill_in "user[email]", with: "jake@adventuretime.com"
      fill_in "user[password]", with: "dog"

      click_on "Create User"

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Account successfully created!")
      expect(page).to have_content("Hi, #{User.last.name}.")
    end
    it "and does not provide name" do
      fill_in "user[email]", with: "jake@adventuretime.com"
      fill_in "user[password]", with: "dog"

      click_on "Create User"

      expect(page).to have_content("Name can't be blank")
    end
    it "and does not provide email" do
      fill_in "user[name]", with: "Jake the Dog"
      fill_in "user[password]", with: "dog"

      click_on "Create User"

      expect(page).to have_content("Email can't be blank")
    end
    it "and does not provide password" do
      fill_in "user[name]", with: "Jake the Dog"
      fill_in "user[email]", with: "jake@adventuretime.com"

      click_on "Create User"

      expect(page).to have_content("Password can't be blank")
    end
  end
end
