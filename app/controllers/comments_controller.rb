class CommentsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @trends = @user.trends
    @notes = @user.notes
    @note_ids = @notes.pluck(:id)
    @comments = NoteComment.where(note_id: @note_ids)
  end
end
