class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @album = Album.find(params[:album_id])
    comment = current_user.comments.build(comments_params)
    comment.album = @album
    if comment.save
      flash[:notice] = "You successfully left a comment!"
      redirect_to album_path(@album)
    end
  end

  def comments_params
    params.require(:comment).permit(:body)
  end
end
