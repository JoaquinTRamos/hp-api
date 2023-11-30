class ProductMaster < ApplicationRecord
  has_many :deal_registers
  has_many :products

  validates :SKU, presence: true, length: { is: 7 }
end
