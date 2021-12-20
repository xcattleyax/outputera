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

  private

  def comment_params
    params.require(:presentation_comment).permit(:comment).merge(user_id: current_user.id,
                                                                 presentation_id: params[:presentation_id])
  end
end
