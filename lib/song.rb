require 'pry'

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
      song = Song.new
      song.save
      return song
  end

  def self.new_by_name(string_name)
      song = Song.new
      song.name = string_name
      return song
  end

  def self.create_by_name(track)
      song = Song.new
      song.name = track
      song.save
      return song
  end

  def self.find_by_name(finder)
      self.all.find{|track| track.name == finder}
  end

  def self.find_or_create_by_name(new)
      self.find_by_name(new) || self.create_by_name(new)
#It looks to see if the left side is nil or false, it returns that value.
  end

  def self.alphabetical
      self.all.sort_by { |track| track.name}
  end

  def self.new_from_filename(yup)
    chopped = yup.split(/\s(-)\s|(.mp3)/)
    song = Song.new
    song.artist_name = chopped[0]
    song.name = chopped[2]
    return song
    #   binding.pry
  end

  def self.create_from_filename(yup)
    chopped = yup.split(/\s(-)\s|(.mp3)/)
    song = Song.new
    song.artist_name = chopped[0]
    song.name = chopped[2]
    song.save
  end

  def self.destroy_all
      self.all.clear
  end
   
end