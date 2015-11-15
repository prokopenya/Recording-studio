class Artist < ActiveRecord::Base
  validates :name, length: { minimum: 3 }

  has_many :albums, dependent: :delete_all
  has_many :tracks, dependent: :delete_all
end
