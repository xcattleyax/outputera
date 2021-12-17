class NotesController < ApplicationController
  def index
  end

  def new
    @note = Note.new
  end

  def show
    @note = Note.find(params[:id])
    @comment = NoteComment.new
    @answers = NoteAnswer.where(note_id: @note.id)
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :text, :category_id).merge(user_id: current_user.id)
  end
end
