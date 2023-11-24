class DealRegister < ApplicationRecord
  has_one :product, class_name: "ProductMaster"
  has_one :deal

  validates :available_range, presence: true
  validates :monto, presence: true
  validates :max_cantidad, presence: true
  validates :product, presence: true
end
