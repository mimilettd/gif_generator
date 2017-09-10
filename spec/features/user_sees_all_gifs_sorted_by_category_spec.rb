require 'rails_helper'

RSpec.feature "User visits category#index" do
  it "and should see gifs sorted by category" do
    setup

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit user_gifs_path(@user)

    expect("cat").to appear_before("dog")
    expect("unicorn").to_not appear_before("cat")
    expect("unicorn").to_not appear_before("dolphin")
    expect("unicorn").to_not appear_before("dog")
    expect(page).to have_css("img[src=\"#{@gif_1.image_path}\"]")
  end
end
