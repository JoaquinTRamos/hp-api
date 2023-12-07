class DealMaster < ApplicationRecord

  attribute :canal_types, :string

  enum canal_types: {
    BNA: 'BNA',
    DISTRIBUCION: 'DISTRIBUCION',
    CIUDAD: 'CIUDAD',
    Online: 'ONLINE'
  }

  has_many :deals

  validates :deals, presence: true
  validates :deal_id, presence: true, length: {is: 8}
  validates :canal, presence: true, length: {minimum: 1}

  def as_json()
    {
      deal_id: deal_id,
      canal_types: canal,
      deals: deals
    }
  end

end
