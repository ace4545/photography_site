class GalleriesController < ApplicationController
  def show
    @gallery = Gallery.find(params[:id])
    @photo = Photo.new
    @photos = Photo.where(gallery_id: @gallery.id)
  end
end
