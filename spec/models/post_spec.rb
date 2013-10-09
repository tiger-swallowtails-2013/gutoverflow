require 'spec_helper'

describe Post do
  context "text field, invalid input" do
    it "must be at least 1 character long" do
      expect(Post.create(text: "")).to_not be_valid
    end
  end

  it "belongs to user" do
    user = User.create(full_name:"dave test", password:"asdf12", email:"123@asdf.com")
    post = Post.create(text: "test")
    user.posts << post
    expect(user.posts.last.id).to eq(post.id)
  end

  it "validates user_id is not null"

  it "has many children (alias responses)" do
    parent = Post.create(text: "parenttest")
    childpost1 = Post.create(text: "test1")
    childpost2 = Post.create(text: "test2")
    parent.responses << childpost1
    parent.responses << childpost2
    expect(parent.responses.all.length).to eq(2)
  end
  #it "has dependency-destroy on children"
end
