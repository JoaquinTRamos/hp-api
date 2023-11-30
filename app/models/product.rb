class Product < ApplicationRecord
  belongs_to :SKU, class_name: "ProductMaster"
  has_one :invoice_register

  validates :SKU, presence: true
  validates :origin, presence: true
  validates :purchase_price, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :pp_currency_code, presence: true, length: {is: 3}
  validates :serial_id, length: {is: 10}, unless: proc { serial_id.nil? }
end
