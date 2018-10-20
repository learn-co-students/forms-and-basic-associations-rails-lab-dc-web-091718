class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  accepts_nested_attributes_for :notes,
    reject_if: Proc.new {|attributes| attributes[:content].blank?}

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

  def note_contents=(notes)
    notes.each do |content|
      if content.length > 0
        self.notes.build(content: content)
      end
    end
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  # add associations here
end
