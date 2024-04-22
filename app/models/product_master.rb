class ProductMaster < ApplicationRecord
  has_many :deal_registers
  has_many :products

  validates :sku, presence: true
  validates :is_active, presence: true
  validates :business_unit, presence: true
  validates :category, presence: true
  validates :subcategory, presence: true
  validates :category_gfast, presence: true
  validates :brand, presence: true

  def as_json()
    {
      sku: sku,
      products: products,
      is_active: is_active,
      business_unit: business_unit,
      category: category,
      subcategory: subcategory,
      category_gfast: category_gfast,
      brand: brand
    }
  end
end
