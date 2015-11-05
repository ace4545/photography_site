class PhotosController < ApplicationController
  attr_accessible :show
    belongs_to :user
  end
  def create
    if current_user.try(:admin?)
    end
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
  def edit
    @photo = Photo.find(params[:id])
  end
  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to gallery_path(@photo.gallery_id)
    else
      render :action => 'edit'
    end
  end

  private
    # Implement Strong Params
    def photo_params
      params.require(:photo).permit(:description, :url)
    end
end
