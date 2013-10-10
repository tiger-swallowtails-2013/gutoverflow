require 'spec_helper'

describe User do
   it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:full_name) }
  it { should_not allow_value("test@test").for(:email) }
  it { should allow_value("shouldwork@example.eu").for(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should_not allow_value("!TeD Brogan").for(:full_name) }
  it { should_not allow_value("jjjj").for(:password) }
  it { should allow_value("sixormore").for(:password) }
end