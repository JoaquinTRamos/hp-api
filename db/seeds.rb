# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Starting seeding process..."

ceven = Entity.find_or_create_by!(tax_id: 30696692951, name: 'CEVEN SA')

ceven.locations.find_or_create_by!(
  address1: 'MANUEL GARCIA 352',
  city: 'CABA',
  prov_code: 'C0',
  postal_code: '1284',
  country_code: 'AR'
  )

meli = Entity.find_or_create_by!(tax_id: 30703088534, name: 'MERCADO LIBRE MARKETPLACE')

meli.locations.find_or_create_by!(
  address1: 'AV CASEROS 3039',
  city: 'CABA',
  prov_code: 'C0',
  postal_code: '1264',
  country_code: 'AR'
  )

enduser1 = Entity.find_or_create_by!(tax_id: 95527234, name: 'ISAAC DAVID SERFATY PENALOZA')

enduser1.locations.find_or_create_by!(
  address1: 'VICENTE LOPEZ Y PLANES 2274',
  city: 'COMODORO RIVADAVIA',
  prov_code: 'U0',
  postal_code: '9000',
  country_code: 'AR'
  )

puts 'Entities created!'

productsku1 = ProductMaster.find_or_create_by!(SKU: '3YM78AL')

puts 'Product Created!'

product1 = Product.find_or_create_by!(
  SKU: productsku1,
  origin: 'HP',
  purchase_price: 14.4,
  pp_currency_code: 'USD'
)

invoice_1 = Invoice.find_or_create_by!(
  invoice_id: 'B500100310924',
  agent_flag: 'Y',
  partner_comment: '102 ML  Tienda HP',
  date: '2023-10-02',
  sales_type: 'RR',
  record_type: 'SD',
  seller: ceven,
  customer: meli,
  enduser: enduser1
  )

puts 'Invoice Created!'

invoice_1.invoice_registers.find_or_create_by!(
  quantity: 1,
  sell_price: 35.65,
  sp_currency_code: 'USD',
  product: product1
)

puts 'Invoice Register created!'

enduser2 = Entity.find_or_create_by!(tax_id: 23269671459, name: 'WALTER OSVALDO BOY')

enduser2.locations.find_or_create_by!(
  address1: 'ESPAA 1511',
  city: 'FLORIDA',
  prov_code: 'B0',
  postal_code: '1602',
  country_code: 'AR'
)

invoice_2 = Invoice.find_or_create_by!(
  invoice_id: 'A500100115623',
  agent_flag: 'Y',
  partner_comment: '102 ML  Tienda HP',
  date: '2023-10-02',
  sales_type: 'RR',
  record_type: 'SD',
  seller: ceven,
  customer: meli,
  enduser: enduser2
)

productsku2 = ProductMaster.find_or_create_by!(SKU: '2D9J9AA')

puts 'Product Created!'

deal1 = DealMaster.find_or_create_by!(deal_id: 45515448, canal: ['BNA', 'CIUDAD', 'Online'])

puts 'DealMaster Created!'

deal1v1 = deal1.deals.find_or_create_by!(deal_master: deal1, version: 1, vigencia: 1)

puts 'Deal Created!'

dealreg1 = deal1v1.deal_registers.find_or_create_by!(
  available_range: ('2023-09-20'..'2023-10-10'),
  monto: 30,
  max_cantidad: 150,
  product: productsku2
)

puts 'Deal Registers Created!'

serials = ['3CM1432VZH', '3CM20131RW', '3CM1432W1B', '3CM1432VZK']

serials.each do |serial|

  tempproduct = Product.find_or_create_by!(
    SKU: productsku2,
    origin: 'HP',
    purchase_price: 167.73,
    pp_currency_code: 'USD',
    serial_id: serial
  )

  invoice_2.invoice_registers.find_or_create_by!(
    product: tempproduct,
    quantity: 1,
    sell_price: 142.04,
    sp_currency_code: 'USD',
    deal_register_id: dealreg1
  )

puts 'Products Created!'

puts 'Finished Seeding!'
end
