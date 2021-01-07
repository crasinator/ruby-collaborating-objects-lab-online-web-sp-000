class Song
  attr_accessor :artist, :name

@@all = [ ]

  def initialize(name)
    @name = name
    @@all << self
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def self.new_by_filename(file)
    str = file.chomp(".mp3").flatten
    song_info = str.split(" - ")
    song = Song.new(song_info[1])
    song.artist_name = song_info[0]
    song 
  end
  
  def self.all 
    @@all 
  end 
  
end