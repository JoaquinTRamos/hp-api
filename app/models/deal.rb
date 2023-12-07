class Deal < ApplicationRecord
  belongs_to :deal_master, class_name: "DealMaster"
  has_many :deal_registers

  validates :version, presence: true

  def as_json()
    {
      vigencia: vigencia,
      version: version,
      registers: deal_registers
    }
  end

end
