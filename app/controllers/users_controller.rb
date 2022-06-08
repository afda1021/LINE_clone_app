class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @current_user = current_user
    @friends = @current_user.matchers
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
      redirect_to users_url
    else
      @user = User.new
      render 'new'
    end
  end

  def search
    if defined?(params[:search_param][:email])
      @user = User.find_by(email: params[:search_param][:email])
    end
  end

  def application
    friendship = Friendship.new(follower_id: current_user.id, followed_id: params[:user_id])
    if friendship.save
      redirect_to users_url
    else
      render 'search'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
