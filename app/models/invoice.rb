class Invoice < ApplicationRecord
  belongs_to :seller, class_name: 'Entity'
  belongs_to :customer, class_name: 'Entity'
  belongs_to :enduser, class_name: 'Entity'
  has_many :invoice_registers

  validates :seller, presence: true
  validates :customer, presence: true
  validates :enduser, presence: true, :unless => :agent_flag.nil?
end
