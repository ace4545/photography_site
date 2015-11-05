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

  private
    # Implement Strong Params
    def photo_params
      params.require(:photo).permit(:description, :url)
    end
end
