require 'rails_helper'

RSpec.describe "User visits a category page" do
  before(:each) do
    setup

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit categories_path
  end
  context "clicks on cat" do
    it "and sees all gifs for cat" do

      within '.col-4' do
        click_link("cat", :match => :first)
      end

      expect(current_path).to eq(category_path(@cat))
      expect(page).to have_css("img[src=\"#{@gif_3.image_path}\"]")
      expect(page).to have_css("img[src=\"#{@gif_4.image_path}\"]")
    end
  end
  context "clicks on dog" do
    it "and sees all gifs for dog" do

      within '.col-4' do
        click_link("dog", :match => :first)
      end

      expect(current_path).to eq(category_path(@dog))
      expect(page).to have_css("img[src=\"#{@gif_5.image_path}\"]")
    end
  end
end
