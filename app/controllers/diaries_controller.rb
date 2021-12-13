class DiariesController < ApplicationController
  def index
    @diary = Diary.new
  end

  def create
  end
end
