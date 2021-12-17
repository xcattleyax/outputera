class NoteAnswersController < ApplicationController

  def create
    @answer = NoteAnswer.new(answer_params)
    if @answer.save
      redirect_to root_path
    else
      @comment = NoteComment.find(params[:note_answer][:note_comment_id])
      @note = Note.find(params[:note_id])
      render "note_comments/show"
    end
  end

  def show
    @answer = NoteAnswer.find(params[:id])
    @answers = NoteAnswer.where(note_id: params[:note_id])
  end

  private

  def answer_params
    params.require(:note_answer).permit(:content, :text).merge(user_id: current_user.id, note_id: params[:note_id])
  end

end
