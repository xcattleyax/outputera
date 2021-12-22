class FollowersController < ApplicationController

  def create
    binding.pry
    @follower = Follower.new(follower_params)
    if @follower.save
      redirect_to root_path
    else
      render "posts/show"
    end
  end

  private
  def follower_params
    params.permit(:follow_id).merge(user_id: current_user.id)
  end
end
