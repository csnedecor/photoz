class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = current_user.photos.find(params[:id])
  end

  def update
    photo = current_user.photos.find(params[:id])

    if photo.update(photo_params)
      photo.reprocess_photo

      flash[:notice] = "Successfully cropped photo"
      redirect_to photo_path(photo)
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:crop_x, :crop_y, :crop_w, :crop_h)
  end
end
