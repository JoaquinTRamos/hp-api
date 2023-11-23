class Product < ApplicationRecord
  belongs_to :SKU, class_name: "ProductMaster"

  validates :SKU, presence: true
  validates :origin, presence: true
  validates :purchase_price, presence: true, purchase_price.to_i.positive?
  validates :pp_currency_code, presence: true, length: {is: 3}
  validates :serial_id, length: {is: 16}, if: presence: true
end
