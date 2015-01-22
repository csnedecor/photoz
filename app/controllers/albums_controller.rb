class AlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
    5.times { @album.photos.build }
  end

  def create
    @album = current_user.albums.build(album_params)

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

    Hit.create(
      album: @album,
      ip_address: request.ip,
      region_code: request.location.state_code
    )

    if !cookies["#{@album.name}_viewed"]
      cookies["#{@album.name}_viewed"] = { expires: 1.year.from_now }
      Visit.create(album: @album, ip_address: request.ip)
    end
  end

  def edit
    @album = current_user.albums.find(params[:id])
    5.times { @album.photos.build }
  end

  def update
    @album = current_user.albums.find(params[:id])

    if @album.update(album_params)
      flash[:notice] = "Successfully updated album!"
      redirect_to album_path(@album)
    else
      render "edit"
    end
  end

  def destroy
    album = current_user.albums.find(params[:id])

    if album.destroy
      flash[:notice] = "Successfully deleted #{album.name}"
    end

    redirect_to user_path(album.user)
  end

  private

  def album_params
    params.require(:album).permit(:name, :description, :photo, :photos_attributes => [:id, :photo, :_destroy])
  end
end
