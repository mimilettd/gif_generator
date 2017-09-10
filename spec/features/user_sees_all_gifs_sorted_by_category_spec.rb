require 'rails_helper'

RSpec.feature "User visits category#index" do
  it "and should see gifs sorted by category" do
    setup

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit user_gifs_path(@user)

    expect("Cat").to appear_before("Dog")
    expect("Unicorn").to_not appear_before("Cat")
    expect("Unicorn").to_not appear_before("Dolphin")
    expect("Unicorn").to_not appear_before("Dog")
    expect(page).to have_css("img[src=\"#{@gif_1.image_path}\"]")
  end
end
