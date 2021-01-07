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
    song_info = file.split(" - ")√Ω
    song = Song.new(song_info[1])
    song.artist_name = song_info[0]
    return song
  end
  
  def self.all 
    @@all 
  end 
end