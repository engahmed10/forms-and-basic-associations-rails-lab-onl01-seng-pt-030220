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

  def note_ids=(ids)
    ids.each do |con|
      #note=Note.find_or_create_by(content:con)
    #  self.notes << note
     @note=self.notes.build(content:con)
    end
  end

  def note_cont
     note=self.notes.map do |note|
        note
     end
  end



end
