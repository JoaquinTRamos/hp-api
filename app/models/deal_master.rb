class DealMaster < ApplicationRecord
  has_many :deals

  validates :deal_id, presence: true, length: {is: 8}
  validates :canal, presence: true, length: {minimum: 1}
end
