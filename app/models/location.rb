class Location < ApplicationRecord
  belongs_to :entity

  validates :address1, presence: true
  validates :city, presence: true
  validates :prov_code, presence: true, length: {is: 2}
  validates :postal_code, presence: true
  validates :country_code, presence: true, length: {is: 3}
end
