class ProductMaster < ApplicationRecord
  belongs_to :invoice_registers
  belongs_to :deal_registers

  validates :SKU, presence: true, length: { is: 16 }
end
