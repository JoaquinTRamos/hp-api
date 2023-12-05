class InvoiceRegister < ApplicationRecord
  belongs_to :product
  has_one :deal_register
  belongs_to :invoice

  validates :product, presence: true
  validates :quantity, presence:true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :sell_price, presence:true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :sp_currency_code, presence:true, length: { is: 3 }

  def as_json()
    {
      product: Product.find(product_id),
      deal_register: deal_register_id,
      quantity: quantity,
      sell_price: sell_price,
      currency_code: sp_currency_code
    }
  end
end
