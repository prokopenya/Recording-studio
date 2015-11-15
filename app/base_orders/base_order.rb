class BaseOrder < ActiveRecord::Base
  validates :check, presence: true

  has_many :pre_orders
end
