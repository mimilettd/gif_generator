require 'rails_helper'

RSpec.describe "Admin visits category#new" do
  it "and can create categories" do
    admin = User.create(name: "Princess Bubblegum",
                        email: "bubbglegum@adventuretime.com",
                        password: "candy",
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_category_path
    expect(page).to have_content("Create a New Category")
  end
end
