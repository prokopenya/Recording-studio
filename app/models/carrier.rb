class Carrier < ActiveRecord::Base
=begin
  validates :name, presence: true,
                        length: { minimum: 2 }
  validates :type, presence: true,
                        length: { minimum: 2 }
  validates :price_of_record, presence: true
  validates :max_duration, presence: true,
                        length: { minimum: 2 }
  validates :capacity, presence: true,
                        length: { minimum: 2 }
=end                        
  has_many :pre_orders
  belongs_to :type_carrier
end
