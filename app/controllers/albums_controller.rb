class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new
    authenticate_user!
  end
end
