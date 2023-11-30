class DealRegister < ApplicationRecord
  belongs_to :product, class_name: "ProductMaster"
  belongs_to :deal

  validates :available_range, presence: true
  validates :monto, presence: true
  validates :max_cantidad, presence: true
  validates :product, presence: true
end
