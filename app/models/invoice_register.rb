class InvoiceRegister < ApplicationRecord
  has_one :product, class_name: "ProductMaster"
  has_one :deal_register
  belongs_to :invoice

  validates :product, presence: true
  validates :deal_register
  validates :quantity, presence:true, quantity.to_i.positive?
  validates :sell_price, presence:true, sell_price.to_i.positive?
  validates :sp_currency_code, presence:true, length: { is: 3 }
end
