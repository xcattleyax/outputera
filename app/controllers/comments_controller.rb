class CommentsController < ApplicationController
  before_action :move_to_root

  def show
    @user = User.find(params[:id])
    @trends = @user.trends
    @notes = @user.notes
    @note_ids = @notes.pluck(:id)
    @comments = NoteComment.where(note_id: @note_ids)
    @presentations = @user.presentations
    @presentation_ids = @presentations.pluck(:id)
    @presentation_comments = PresentationComment.where(presentation_id: @presentation_ids)
  end

  private

  def move_to_root
    unless current_user.id == params[:id]
      redirect_to root_path
    end
  end
end
