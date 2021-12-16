class PresentationsController < ApplicationController
  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(presentation_params)
    if @presentation.save
      redirect_to new_presentation_content_path(@presentation.id)
    else
      render 'new'
    end
  end

  private

  def presentation_params
    params.require(:presentation).permit(:title, :category_id).merge(user_id: current_user.id, detail_id: 1)
  end
end
