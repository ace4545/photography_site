class PhotosController < ApplicationController
  def create
    @photo = Photo.new(photo_params)
    @photo.gallery_id = params[:gallery_id]
    if @photo.save
      redirect_to gallery_path(params[:gallery_id])
    else
      render 'new'
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to gallery_path(photo.gallery_id)
  end

  private
    # Implement Strong Params
    def photo_params
      params.require(:photo).permit(:description, :url)
    end
end
