class Track < ActiveRecord::Base
  validates :name, presence: true,
                        length: { minimum: 2 }
  validates :duration, presence: true

  belongs_to :album
  belongs_to :genre
  belongs_to :author
  #belongs_to :pre_order
  #belongs_to :base_order
  belongs_to :artist

end
