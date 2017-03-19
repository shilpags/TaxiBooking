class Payment < ActiveRecord::Base
  validates_presence_of :holder_name
  validates_presence_of :card_number
  validates_presence_of :card_cvv
  validates_presence_of :card_expiry
end
