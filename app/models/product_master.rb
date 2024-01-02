class ProductMaster < ApplicationRecord
  has_many :deal_registers
  has_many :products

  validates :sku, presence: true

  def as_json()
    {
      sku: sku,
      products: products
    }
  end
end
