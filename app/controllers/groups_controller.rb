class GroupsController < ApplicationController

  def index
    @group = Group.all
  end

  def new
    @group = Group.new
    @group.members.build
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :index, notice: 'リストを作成しました'
    else
      render :new
    end
    # @group = Group.new(group_params)
    # if @group.save
    #   redirect_to root_path, notice: 'グループを作成しました'
    # else
    #   render :new
    # end
    # group = Group.create!(group_params)
    # group.user_ids.each do |user_id|
    #   user = User.find_by(user_id: user_id)
    #   group.members.create!(user: user)

    # @group = Group.new(group_params)

    # if @group.save
    #   binding.pry
    # group = Group.create!(group_params)
    # group.user_ids.each do |user_id|
    #   user = User.find_by(user_id: user_id)
    #   group.members.create!(user: user)

    # render :index
    # end
  end

  def show
    @tweet = Tweet.pluck(:tweet_id)
  end

  def edit
    # @group = Group.find(params[:id])
    # if @group.update(name: params[:name], id: params[:id])
    #   redirect_to :index, notice: 'グループを更新しました'
    # else
    #   render :edit
    # end
  end

  def update
    if @group.update(group_params)
    redirect_to group_messages_path(@group), notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group, ).permit(:group_name, :hashtag, user_ids: [])
  end
  user

  # def set_group
  #   @group = Group.find(params[:id])
  # end
end