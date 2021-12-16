class ContentsController < ApplicationController
  def new
    @content = PresentationContent.new
    @presentation = Presentation.find(params[:presentation_id])
    @contents = @presentation.presentation_content
    @page = @contents.pluck(:page)
    @page = if @page.nil?
              1
            else
              @page.max.to_i + 1
            end
  end

  def create
    @content = PresentationContent.new(content_params)
    if @content.save
      redirect_to new_presentation_content_path(@content.presentation_id)
    else
      @page = @content.page
      render 'new'
    end
  end

  private

  def content_params
    params.require(:presentation_content).permit(:page, :content, :text).merge(presentation_id: params[:presentation_id])
  end
end
