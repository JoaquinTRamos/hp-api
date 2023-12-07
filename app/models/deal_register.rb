class DealRegister < ApplicationRecord
  belongs_to :product, class_name: "ProductMaster"
  belongs_to :deal

  validates :available_range, presence: true
  validates :monto, presence: true
  validates :max_cantidad, presence: true
  validates :product, presence: true

  def as_json()
    {
      product: product.sku,
      monto: monto,
      max_cantidad: max_cantidad,
      available_range: available_range
    }
  end
end
