require 'rails_helper'

RSpec.describe "Only admins can delete categories" do
  before(:each) do
    categories = ["animals", "politics", "teachers", "nature"]

    categories.each do |name|
      Category.create(name: name)
    end
  end
  context "Admin visits categories#index" do
    it "and can delete any category listed" do
      admin = User.create(name: "Princess Bubblegum",
                          email: "bubbglegum@adventuretime.com",
                          password: "candy",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit categories_path

      first('.card-body').click_link('DELETE')

      expect(page).to_not have_content("animals")
      expect(current_path).to eq(categories_path)
    end
  end
  context "Default user visits categories#index" do
    it "and cannot see delete button to delete categories" do
      default_user = User.create(name: "Princess Bubblegum",
                                 email: "bubbglegum@adventuretime.com",
                                 password: "candy",
                                 role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      visit categories_path

      expect(page).to_not have_link("Delete")
    end
  end
end
