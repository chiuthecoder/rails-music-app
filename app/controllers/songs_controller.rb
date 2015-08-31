class SongsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @songs = Song.all
  end

  def new
    @user = User.find(session[:user_id])
    @songs = @user.songs
  end

  def create
    user = User.find(song_params[:id].to_i)
    # @song = Song.create(artist: song_params[:artist], content: song_params[:content], user: user)
    @song = Song.new(artist: song_params[:artist], content: song_params[:content], user: user)
    if @song.save
      flash[:notice] = 'New song created!'
      redirect_to :back
    else
      flash[:errors] = @song.errors.full_messages
      redirect_to :back
    end
  end

  def show
    # puts song_params[:id]
    # puts @song
    @user = User.find(session[:user_id])
    @song = Song.find(params[:id])
    # @likes = Like.joins(:user).where(song_id:1).select("first_name", "last_name","song_id").group("first_name")
    # @likes = Like.joins(:user).where(song_id: params[:id]).select("first_name", "last_name","song_id").group("first_name")
    # @likes =Like.where(song: @song, user:@user)
    # @likes = Like.joins(:user).joins(:song).where(song_id: song_params[:id]).select("first_name", "last_name","song_id").group("first_name")
    
    # @songs = Song.all
    # @likes = Like.joins(:user).where(song_id:1).select("first_name", "song_id").group("first_name")
  end

  def edit
  end

  def update
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to '/songs/new'
  end

  private
    def song_params
      params.require(:song).permit(:artist, :content, :id, :user_id)
    end
end
