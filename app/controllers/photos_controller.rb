class PhotosController < ApplicationController
  def show
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
  end

  def edit
    @album = Album.find(params[:album_id])
    @photo = Photo.find(params[:id])
    if !signed_in?
      flash[:alert] = "You must be signed in to do that"
      redirect_to album_photo_path(@album, @photo)
    elsif@album.user != current_user
      flash[:alert] = "You can't edit someone else's photo"
      redirect_to album_photo_path(@album, @photo)
    end
  end

  def update
    photo = Photo.find(params[:id])
    if photo.update(photo_params)
      photo.reprocess_photo
      flash[:notice] = "Successfully cropped photo"
      redirect_to album_photo_path(photo.album, photo)
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:crop_x, :crop_y, :crop_w, :crop_h)
  end
end
