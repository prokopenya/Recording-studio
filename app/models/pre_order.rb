class PreOrder < ActiveRecord::Base
  #validates :data_time_order, presence: true
  
  belongs_to :track
  belongs_to :base_order
  belongs_to :carrier
end
