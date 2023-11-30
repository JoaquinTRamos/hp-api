class Deal < ApplicationRecord
  belongs_to :deal_master
  has_many :deal_registers

  validates :version, presence: true
  validates :vigencia, presence: true

  validate :version_already_exists_for_deal?, on: :create

  def version_already_exists_for_deal?
    if Deal.exists?(version: version, deal_master_id: deal_master_id)
      errors.add(:base, 'Ya existe esta version del deal')
    end
  end

end
