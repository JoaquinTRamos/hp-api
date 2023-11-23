class ProductMaster < ApplicationRecord
  has_many :invoice_registers
  has_many :deal_registers

  validates :SKU, presence: true, length: { is: 16 }
end
