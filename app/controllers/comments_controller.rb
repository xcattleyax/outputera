class CommentsController < ApplicationController
  before_action :move_to_root

  def show
    @user = User.find(params[:id])
    @trends = @user.trends
    notes = @user.notes.pluck(:id)
    @comments = NoteComment.where(note_id: notes)
    presentations = @user.presentations.pluck(:id)
    @presentation_comments = PresentationComment.where(presentation_id: presentations)
  end

  private

  def move_to_root
    redirect_to root_path unless current_user.id.to_s == params[:id]
  end
end
