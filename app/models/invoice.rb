class Invoice < ApplicationRecord
  belongs_to :seller, class_name: 'Entity'
  belongs_to :customer, class_name: 'Entity'
  belongs_to :enduser, class_name: 'Entity', optional: true
  has_many :invoice_registers

  validates :seller, presence: true
  validates :customer, presence: true
  validates :enduser, presence: true, unless: proc {agent_flag != 'Y'}


  def as_json()
    {
      id: invoice_id,
      agent_flag: agent_flag,
      partner_comment: partner_comment,
      date: date,
      sales_type: sales_type,
      record_type: record_type,
      seller: Entity.find(seller.id).as_json,
      customer: Entity.find(customer.id).as_json,
      enduser: if enduser.nil? then '' else Entity.find(enduser.id).as_json end,
      registers: InvoiceRegister.where("invoice_id=?",id)
    }
  end
end
