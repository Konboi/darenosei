class HomeController < ApplicationController
  def index
  end

  def degree
    session["who"] = params[:who][:name]
    logger.debug(session["who"])
  end

  def generate
    image = ImageGenerator.new
    image.write(session["who"], params[:degree])
    @path = image.save
    @image = Image.create(
      path: @path
    )
  end

  def show
    @image = Image.where(id: params[:id]).first
    redirect_to root_path unless @image
  end
end
