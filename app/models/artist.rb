class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.split(" ").collect{|part| part.downcase }.join("-")
  end

  def self.find_by_slug(slug)
    name = slug.split('-').collect {|part| part.capitalize }.join(" ")
    Artist.where("lower(name) = ?",name.downcase).first
  end
end
