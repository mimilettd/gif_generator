require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: "Jake the Dog",
                        email: "jake@adventuretime.come",
                        password: "dog")
  end
  it "is valid with valid attributes" do
    expect(@user).to be_valid
  end
  it "is not valid without a name" do
    @user.name = nil
    expect(@user).to_not be_valid
  end
  it "is not valid without an email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end
  it "is not valid without a password" do
    @user.password = nil
    expect(@user).to_not be_valid
  end
  it "is not valid if email is not unique" do
    user_2 = User.create(name: "Lumpy Space Princess",
                         email: "jake@adventuretime.come",
                         password: "lumps")

    expect(user_2).to_not be_valid
  end
end

RSpec.describe User, type: :model do
  it "can be created as an admin" do
    user = User.create(name: "Jake the Dog",
                       email: "jake@adventuretime.come",
                       password: "dog",
                       role: 1)
    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end
  it "can be created as a default user" do
    user = User.create(name: "Jake the Dog",
                       email: "jake@adventuretime.come",
                       password: "dog",
                       role: 0)

    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end
end
