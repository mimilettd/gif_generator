require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @category = Category.create(name: "Cats")
  end
  it "is valid with valid attributes" do
    expect(@category).to be_valid
  end
  it "is not valid without a name" do
    @category.name = nil
    expect(@category).to_not be_valid
  end
  it "is not valid if name already exists" do
    category_2 = Category.create(name: "Cats")
    expect(category_2).to_not be_valid
  end
end
