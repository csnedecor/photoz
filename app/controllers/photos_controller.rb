class PhotosController < ApplicationController
  def show
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
  end
end
