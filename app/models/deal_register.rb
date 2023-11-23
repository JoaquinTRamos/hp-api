class DealRegister < ApplicationRecord
  belongs_to :product_sku, class_name: "ProductMaster"
  belongs_to :deal

  validates :available_range, presence: true
  validates :monto, presence: true
  validates :max_cantidad, presence: true
  validates :product_sku, presence: true
  validates :deal_id_id, presence: true
end
