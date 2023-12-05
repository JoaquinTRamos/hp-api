class Location < ApplicationRecord
  has_and_belongs_to_many :entities

  validates :address1, presence: true
  validates :city, presence: true
  validates :prov_code, presence: true, length: {is: 2}
  validates :postal_code, presence: true
  validates :country_code, presence: true, length: {is: 2}

  def as_json()
    super(:only => [:address1, :city, :prov_code, :postal_code, :country_code])
  end
end
