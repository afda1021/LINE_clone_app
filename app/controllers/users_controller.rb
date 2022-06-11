class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @current_user = current_user
    @follow_request_users = current_user.follow_requests
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
    if defined?(params[:search_param][:email]) && params[:search_param][:email].present?
      searched_user = User.find_by(email: params[:search_param][:email])
       if searched_user != current_user && !current_user.following.find {|u| u==searched_user}
        @searched_user = searched_user
       end
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
