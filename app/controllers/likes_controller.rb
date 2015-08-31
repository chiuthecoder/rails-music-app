class LikesController < ApplicationController
  def index
     @like = Like.all
  end

  def new
  end

  def create
    # user = User.find(song_params[:id].to_i)
    @like = Like.create(song_id: like_params[:song_id], user_id: like_params[:user_id])
    redirect_to '/songs'
  end

  def show
     @like = Like.all
  end

  def edit
  end

  def update
  end

  def destroy
    # Like.where(song_id: 8, user_id: 1)
    # @like = Like.where(user_id: like_params[:user_id], song_id: like_params[:song_id])
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to '/songs'
  end

  private
    def like_params
      params.require(:like).permit(:song_id, :user_id)
    end
end
