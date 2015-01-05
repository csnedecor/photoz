class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new
    authenticate_user!
    @album = Album.new
    5.times { @album.photos.build }
  end

  def create
    @album = Album.new(album_params)
    @album.user = current_user
    @album.save
    if @album.save
      flash[:notice] = "You've created a new album!"
      redirect_to album_path(@album)
    else
      5.times { @album.photos.build }
      render "new"
    end
  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos.order(:photo_updated_at)
  end

  def edit
    @album = Album.find(params[:id])
    5.times { @album.photos.build }
  end

  def update
    album = Album.find(params[:id])

    if album.update(album_params)
      flash[:notice] = "Successfully updated album!"
      redirect_to album_path(album)
    else
      @album = album
      render "edit"
    end
  end

  private
    def album_params
      params.require(:album).permit(:name, :description, :photo, :photos_attributes => [:id, :photo, :_destroy])
    end
end
