class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.split(" ").collect{|part| part.downcase }.join("-")
  end

  def self.find_by_slug(slug)
    name = slug.split('-').collect {|part| part.capitalize }.join(" ")
    Song.where("lower(name) = ?",name.downcase).first
  end

end
