class TrendsController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def show
    @diaries = @user.diaries
    @trend = Trend.new(trend_params)
    unless @trend == nil || @trend.category_id == 1
      @diaries = @diaries.where(category_id: @trend.category_id)
    end
  end

  def new
    @trend = Trend.new
    @user = User.find(current_user.id)
    @trends = @user.trends.pluck(:category_id)
  end

  def create
    @trend = Trend.new(trend_params)
    if @trend.save
      redirect_to trend_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    @trend_categories = @trends.pluck(:category_id)
  end

  def destroy
    @trend = Trend.find_by(user_id: params[:id], category_id: params[:category_id])
    @trend.destroy
    redirect_to trend_path(current_user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
    @trends = @user.trends
  end

  def trend_params
    params.require(:trend).permit(:category_id).merge(user_id: current_user.id)
  end
end
