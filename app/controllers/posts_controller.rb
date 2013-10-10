class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.new(valid_params(params))
    if @post.save
      redirect_to :show
    else
      render :new
    end
  end

  def index

  end

  def show

  end

  private

  def valid_params(input)
    input.require(:post).permit(:text, :user_id)
  end
end
