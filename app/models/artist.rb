class Artist < ActiveRecord::Base
  # has_many :genres, through: :songs
  has_many :songs
  # add associations here
end
