class Entity < ApplicationRecord
  has_many :locations
  belongs_to :invoice

  validates :tax_id, presence: true, length: {in: 19..20}
  validates :name, presence: true
end
