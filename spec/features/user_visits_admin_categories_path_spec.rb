require 'rails_helper'

RSpec.describe "User visits category#new" do
  context "as admin" do
    it "they can create categories" do
      admin = User.create(name: "Princess Bubblegum",
                          email: "bubbglegum@adventuretime.com",
                          password: "candy",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path
      expect(page).to have_content("Create a New Category")
    end
  end
  context "as user" do
    it "they cannot access categories#new" do
      user = User.create(name: "Jake the Dog",
                          email: "jakegum@adventuretime.com",
                          password: "dog",
                          role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_category_path
      expect(page).to_not have_content("Create a New Category")
      expect(page).to have_content("The page you were looking for doesn't exist (404) The page you were looking for doesn't exist. You may have mistyped the address or the page may have moved. If you are the application owner check the logs for more information.")
    end
  end
end
