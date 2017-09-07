require 'rails_helper'

RSpec.describe "User logs out of current account" do
  it "User clicks 'Logout' link and logs out" do
    user = User.create(name: "Jake the Dog",
                email: "jake@adventuretime.com",
                password: "dog")

    visit user_path(user)

    click_link 'Logout'

    expect(current_path).to eq('/')
  end
end
