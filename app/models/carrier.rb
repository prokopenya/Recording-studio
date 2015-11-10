class Carrier < ActiveRecord::Base
  validates :name, presence: true,
                        length: { minimum: 2 }
#  validates :type, presence: true,
  #                     length: { minimum: 2 }
  validates :price_of_record, presence: true
  validates :max_duration, presence: true,
                        length: { minimum: 2 }
  validates :capacity, presence: true,
                        length: { minimum: 2 }
  has_many :pre_orders
end
