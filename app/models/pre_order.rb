class PreOrder < ActiveRecord::Base

  belongs_to :track
  belongs_to :base_order
  belongs_to :carrier

end
