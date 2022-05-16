class GroupsController < ApplicationController
  def index
    # ログインユーザーのグループのみを表示したい
    @groups = tmp_user.groups
  end

  def new
    @group = Group.new
  end

  def create

    @group = Group.new(group_params)

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, user_ids: [])
  end

  # ログイン機能ができるまで仮で作成。
  def tmp_user
    User.first
  end
end
