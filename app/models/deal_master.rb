class DealMaster < ApplicationRecord

  attribute :canal_types, :string
  enum canal_types: {
    BNA: 'BNA',
    DISTRIBUCION: 'DISTRIBUCION',
    CIUDAD: 'CIUDAD',
    Online: 'ONLINE'
  }

  has_many :deals

  validates :deal_id, presence: true, length: {is: 8}
  validates :canal, presence: true, length: {minimum: 1}
end
