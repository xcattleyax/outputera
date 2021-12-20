class PresentationAnswersController < ApplicationController

  def create
    @answer = PresentationAnswer.new(answer_params)
    if @answer.save
      redirect_to root_path
    else
      @comment = PresentationComment.find(params[:presentation_answer][:presentation_comment_id])
      @presentation = Presentation.find(params[:presentation_id])
      render 'presentation_comments/show'
    end
  end

  def show
    @answer = PresentationAnswer.find(params[:id])
    @answers = PresentationAnswer.where(presentation_id: params[:presentation_id])
  end

  private
  def answer_params
    params.require(:presentation_answer).permit(:content, :text).merge(user_id: current_user.id, presentation_id: params[:presentation_id])
  end
end
