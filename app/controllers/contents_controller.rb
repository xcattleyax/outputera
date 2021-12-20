class ContentsController < ApplicationController
  def new
    @content = Content.new
    @presentation = Presentation.find(params[:presentation_id])
    @contents = @presentation.contents
    page = @contents.pluck(:page)
    @page = if page.nil?
              1
            else
              page.max.to_i + 1
            end
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to new_presentation_content_path(@content.presentation_id)
    else
      @page = @content.page
      render 'new'
    end
  end

  def edit
    @presentation = Presentation.find(params[:presentation_id])
    @contents = @presentation.contents
    @page = params[:page]
    @content = Content.find_by(presentation_id: @presentation.id, page: @page)
  end

  def update
    content = Content.find(params[:id])
    content.update(content_params)
    redirect_to new_presentation_content_path(content.presentation_id)
  end

  private

  def content_params
    params.require(:content).permit(:page, :content, :text).merge(presentation_id: params[:presentation_id])
  end
end
