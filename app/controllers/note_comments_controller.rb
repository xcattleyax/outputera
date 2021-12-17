class NoteCommentsController < ApplicationController

  def create
    @comment = NoteComment.new(comment_params)
    if @comment.save
      redirect_to root_path
    else
      @note = Note.find(params[:note_id])
      render "notes/show"
    end
  end

  def show
    @comment = NoteComment.find(params[:id])
    @note = Note.find(params[:id])
    @answer = NoteAnswer.new
  end

  private
  def comment_params
    params.require(:note_comment).permit(:comment).merge(user_id: current_user.id, note_id: params[:note_id], status_id: 1)
  end
end
