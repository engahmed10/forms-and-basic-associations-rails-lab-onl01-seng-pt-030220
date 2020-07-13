class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
  #song[note_ids][]
    #byebug
#@song=Song.new(title:params[:song][:title],artist_name:params[:song][:artist_name],genre_name:params[:song][:genre_name],note_ids:params[:song][:note_ids])
  @song=Song.new(song_params)
    #byebug
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title,:artist_name,:genre_name, note_ids: [])
  end
end

#note_ids=["",""]


#params[:song][:note_ids][]
#:note_cont => []
# note_cont=(note_ids)
