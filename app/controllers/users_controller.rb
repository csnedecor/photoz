class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @albums = Album.where(user: current_user)
  end

end
