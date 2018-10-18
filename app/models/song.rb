class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist #name:string
  belongs_to :genre #name:string
  has_many :notes #notes have content:string


  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
    # if !self.genre == nil return self.genre.name
    # else return nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(contents)
    contents.each do |content|
      if content != nil
      note = Note.create(content: content)
      self.notes << note
      end
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end






end
