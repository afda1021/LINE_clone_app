class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email))
    if @user.save
      redirect_to users_url
    else
      @user = User.new
      render 'new'
    end
  end
end
