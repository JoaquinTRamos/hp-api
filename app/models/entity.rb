class Entity < ApplicationRecord
  has_and_belongs_to_many :locations
  has_many :invoices

  validates :tax_id, presence: true, length: {maximum: 20}
  validates :name, presence: true
end
