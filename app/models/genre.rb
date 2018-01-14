class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs


  def slug
    name.split(" ").collect{|part| part.downcase }.join("-")
  end

  def self.find_by_slug(slug)
    name = slug.split('-').collect {|part| part.capitalize }.join(" ")
    Genre.where("lower(name) = ?",name.downcase).first
  end
end
