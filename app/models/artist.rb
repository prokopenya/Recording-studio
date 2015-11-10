class Artist < ActiveRecord::Base
  validates :name, presence: true,
                          length: { minimum: 2 }
  has_many :albums, dependent: :delete_all
  has_many :tracks, dependent: :delete_all
end
