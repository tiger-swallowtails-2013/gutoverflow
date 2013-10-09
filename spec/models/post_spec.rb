require 'spec_helper'

describe Post do
  context "text field, invalid input" do
    it "must be at least 1 character long" do
      user = User.create(full_name:"dave test", password:"asdf12", email:"125@asdf.com")
      expect(Post.create(text: "", user_id: user.id)).to_not be_valid
    end
  end

  it "belongs to user" do
    user = User.create(full_name:"dave test", password:"asdf12", email:"123@asdf.com")
    post = Post.create(text: "test")
    user.posts << post
    expect(user.posts.last.id).to eq(post.id)
  end

  it "validates user_id is not null" do
    post = Post.create(text: "test")
    expect(post.valid?).to eq(false)
  end

  it "has many children (alias responses)" do
    user = User.create(full_name:"dave test", password:"asdf12", email:"124@asdf.com")
    parent = Post.create(text: "parenttest")
    parent.user_id = user.id
    childpost1 = Post.create(text: "test1",)
    childpost1.user_id = user.id
    childpost2 = Post.create(text: "test2")
    childpost2.user_id = user.id
    parent.responses << childpost1
    parent.responses << childpost2
    expect(parent.responses.all.length).to eq(2)
  end

  pending "has dependency-destroy on children"
end
