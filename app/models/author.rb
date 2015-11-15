class Author < ActiveRecord::Base
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }
  has_many :tracks
end
