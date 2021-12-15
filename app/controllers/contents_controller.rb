class ContentsController < ApplicationController

  def new
    @content = PresentationContent.new
  end
end
