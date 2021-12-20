class NoteCommentsController < ApplicationController
  before_action :move_to_root, only:[:show]

  def create
    @comment = NoteComment.new(comment_params)
    if @comment.save
      redirect_to root_path
    else
      @note = Note.find(params[:note_id])
      render 'notes/show'
    end
  end

  def show
    @comment = NoteComment.find(params[:id])
    @answer = NoteAnswer.new
  end

  def destroy
    @comment = NoteComment.find(params[:id])
    @comment.destroy
    redirect_to comment_path(current_user.id)
  end

  private

  def comment_params
    params.require(:note_comment).permit(:comment).merge(user_id: current_user.id, note_id: params[:note_id])
  end

  def move_to_root
    @note = Note.find(params[:note_id])
    unless @note.user_id == current_user.id
      redirect_to root_path
    end
  end
end
