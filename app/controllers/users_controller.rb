class UsersController < ApplicationController
  def new

  end

  def create
    if params[:user]
      User.create(params[:user])
      redirect_to :show
    else
      redirect_to :new
    end
  end
end