class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(params))
    if @user.save
      # flash[:notice] = "You Signed up successfully"
      redirect_to user_path(@user)
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params(params)
    params[:user].permit(:full_name, :email, :password)
  end

end