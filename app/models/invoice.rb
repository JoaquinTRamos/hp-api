class Invoice < ApplicationRecord
  has_one :seller, class_name: "Entity"
  has_one :customer, class_name: "Entity"
  has_one :enduser, class_name: "Entity"
  has_many :registers

  validates :seller_id, presence: true
  validates :customer_id, presence: true
  validates :enduser_id, presence: true, unless {agent_flag == 'Y'}

end
