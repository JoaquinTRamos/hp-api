class Entity < ApplicationRecord
  has_and_belongs_to_many :locations
  has_many :invoices

  validates :tax_id, presence: true, length: {maximum: 20}
  validates :name, presence: true

  def as_json()
    {
      tax_id: tax_id,
      name: name,
      locations: locations
    }
  end
end
