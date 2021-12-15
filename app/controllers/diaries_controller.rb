class DiariesController < ApplicationController
  def index
    @diary = Diary.new
    if user_signed_in?
      @diary_info = Diary.find_by(date: Date.today, user_id: current_user.id)
      @diary_info_yesterday = Diary.find_by(date: Date.today - 1, user_id: current_user.id)
      @diary_status = if @diary_info.nil? && @diary_info_yesterday.nil?
                        nil
                      elsif @diary_info.nil?
                        Date.today
                      elsif @diary_info_yesterday.nil?
                        Date.today - 1
                      else
                        'OK'
                      end
    end
    @notes = Note.all
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
