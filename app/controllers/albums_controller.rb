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
      if @album.photos == []
        5.times { @album.photos.build }
      end
      render "new"
    end
  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos.order(id: :asc)
  end

  def edit
    @album = Album.find(params[:id])
    if !signed_in?
      flash[:alert] = "You must be signed in to do that"
      redirect_to album_path(@album)
    elsif @album.user != current_user
      flash[:alert] = "You can't edit someone else's album"
      redirect_to album_path(@album)
    end
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

  def destroy
    album = Album.find(params[:id])
    if album.destroy
      flash[:notice] = "Successfully deleted #{album.name}"
      redirect_to user_path(album.user)
    end
  end

  private
    def album_params
      params.require(:album).permit(:name, :description, :photo, :photos_attributes => [:id, :photo, :_destroy])
    end
end
