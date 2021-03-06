class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
    flash[:notice] = "Image successfully added!"
      redirect_to  images_path
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image= Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "Image successfully updated!"
      redirect_to images_path
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      flash[:notice] = "Image successfully removed!"
      redirect_to images_path
    end
  end

private
  def image_params
    params.require(:image).permit(:url)
  end
end
