class Album < ActiveRecord::Base
  validates :name, presence: true,
                         length: { minimum: 3 }
  belongs_to :artist
  has_many :tracks
end
