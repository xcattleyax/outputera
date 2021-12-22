class PostsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @trends = @user.trends
    @notes = @user.notes.order('created_at DESC')
    presentations = @user.presentations.order('created_at DESC')
    @presentations = presentations.where(detail_id: 2)
    @followers = @user.followers.pluck(:follow_id)
  end
end
