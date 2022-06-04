class UsersController < ApplicationController
  def index
    # TODO: ログイン機能実装マージ後current_userに修正
    @current_user = User.first
    @friends = @current_user.matchers
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
