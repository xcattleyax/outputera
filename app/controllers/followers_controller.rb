class FollowersController < ApplicationController

  def create
    @follower = Follower.new(follower_params)
    if @follower.save
      redirect_to root_path
    else
      render "posts/show"
    end
  end

  def show
    @user = User.find(params[:id])
    @trends = @user.trends
    @followers = @user.followers
    @follow_ids = @followers.pluck(:follow_id)
    @follow_number = @follow_ids.length
  end

  private
  def follower_params
    params.permit(:follow_id).merge(user_id: current_user.id)
  end
end
