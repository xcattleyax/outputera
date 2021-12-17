class PresentationCommentsController < ApplicationController

  def create
    @comment = PresentationComment.new(comment_params)
    if @comment.save
      redirect_to root_path
    else
      @note = Presentation.find(params[:presentation_id])
      render 'presentations/show'
    end
  end
