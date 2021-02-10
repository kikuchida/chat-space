class GroupsController < ApplicationController

  def index
  end

  def new  # 新規グループ作成の画面を表示する
    @group = Group.new
    @group.users << current_user
  end

  def create  # 画面に入力された情報をもとに、新しいグループを作成する
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def edit  # グループ編集の画面を表示する
    @group = Group.find(params[:id])
  end

  def update  # 画面に入力された情報をもとに、グループを編集する
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [] )
  end

end