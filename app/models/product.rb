class Product < ApplicationRecord
  belongs_to :product_master
  has_one :invoice_register, class_name: "InvoiceRegister"

  validates :origin, presence: true
  validates :purchase_price, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :pp_currency_code, presence: true, length: {is: 3}
  validates :serial_id, length: {is: 10}, unless: proc { serial_id.nil? }

  def as_json()
    {
      id: id,
      sku: product_master.sku,
      option: option,
      origin: origin,
      serial: serial_id,
      purchase_price: purchase_price,
      currency_code: pp_currency_code
    }
  end
end
