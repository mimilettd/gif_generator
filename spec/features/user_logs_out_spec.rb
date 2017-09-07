require 'rails_helper'

RSpec.describe "User logs out of current account" do
  it "User clicks 'Logout' link and logs out" do
    User.create(name: "Jake the Dog",
                email: "jake@adventuretime.com",
                password: "dog")

    visit '/'

    click_link 'Login'

    fill_in "session[email]", with: "jake@adventuretime.com"
    fill_in "session[password]", with: "dog"

    click_on 'Login'

    click_link 'Logout'

    expect(current_path).to eq('/')
  end
end
