class DiariesController < ApplicationController
  def index
    @diary = Diary.new
    if user_signed_in?
      diary_info = Diary.find_by(date: Date.today, user_id: current_user.id)
      diary_info_yesterday = Diary.find_by(date: Date.today - 1, user_id: current_user.id)
      @diary_status = Diary.status(diary_info, diary_info_yesterday)
    end
    @notes = Note.all.order('created_at DESC')
    @presentations = Presentation.where(detail_id: 2).order('updated_at DESC')
  end

  def create
    @diary = Diary.new(diary_params)
    @diary_info = Diary.find_by(date: @diary.date, user_id: @diary.user_id)
    if @diary_info.nil? && @diary.save
      redirect_to trend_path(current_user.id)
    else
      redirect_to root_path
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:date, :time, :category_id).merge(user_id: current_user.id)
  end
end
