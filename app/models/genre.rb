class Genre < ActiveRecord::Base
  validates :name, length: { minimum: 3 }

  has_many :tracks
end
