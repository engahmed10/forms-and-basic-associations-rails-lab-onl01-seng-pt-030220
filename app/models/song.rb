class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist=Artist.find_or_create_by(name:name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end


  def genre_name=(name)
    self.genre=Genre.find_or_create_by(name:name)
  end

  def genre_name
      self.genre ? self.genre.name : nil
  end




  def note_cont=(note_ids)
    note_ids.each do |con|
      note=Note.find_or_create_by(content:con)
      song.notes << note
     #@note=song.notes.build(content:con)
    end
  end

  #def note_cont
  #   self.notes.each do ||
  #end



end
