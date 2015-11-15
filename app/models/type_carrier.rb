class TypeCarrier < ActiveRecord::Base
  validates :max_duration, presence: true
  has_many :carriers
end
