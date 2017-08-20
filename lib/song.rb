class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.detect{|s| s.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
    parts = file.split(" - ")
    song = self.new_by_name(parts[1].chomp(".mp3"))
    song.artist_name = parts[0]
    return song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file).save
    return song
  end

  def self.destroy_all
     @@all.clear
  end

end
