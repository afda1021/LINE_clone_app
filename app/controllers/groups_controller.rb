class GroupsController < ApplicationController
  before_action :logged_in_user, only: [:index, :new]

  def index
    @groups = current_user.groups
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
end
