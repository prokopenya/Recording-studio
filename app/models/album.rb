class Album < ActiveRecord::Base
  validates :name, length: { minimum: 3 }

  belongs_to :artist
  has_many :tracks

end
