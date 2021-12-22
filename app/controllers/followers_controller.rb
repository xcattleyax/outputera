class FollowersController < ApplicationController
  def create
    @follower = Follower.new(follower_params)
    if @follower.save
      redirect_to root_path
    else
      render 'posts/show'
    end
  end

  def show
    @user = User.find(params[:id])
    @trends = @user.trends
    @follow_ids = @user.followers.pluck(:follow_id)
    @followers = User.where(id: @follow_ids)
    @follow_number = @follow_ids.length
    @followings = Follower.where(follow_id: @user.id)
    @following_ids = @followings.pluck(:user_id)
    @following_users = User.where(id: @following_ids)
    @following_number = @following_ids.length
  end

  private

  def follower_params
    params.permit(:follow_id).merge(user_id: current_user.id)
  end
end
