class HomesController < ApplicationController
  def index
    @galleries = Gallery.all
  end
end
