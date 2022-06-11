class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    if current_user.follow(user)
      redirect_to users_url
    else
      render 'search'
    end
  end
end
