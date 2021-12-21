class OpinionsController < ApplicationController

  def index
    @opinions = Opinion.all.order("created_at DESC")
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = Opinion.new(opinion_params)
    if @opinion.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @opinion = Opinion.find(params[:id])
  end

  private
  def opinion_params
    params.require(:opinion).permit(:title, :content).merge(user_id: current_user.id)
  end
end