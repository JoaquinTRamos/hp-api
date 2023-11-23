# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_17_142935) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "canal_types", ["DISTRIBUCION", "Online", "BNA", "CIUDAD"]

  create_table "deal_masters", force: :cascade do |t|
    t.integer "deal_id"
    t.enum "canal", null: false, array: true, enum_type: "canal_types"
  end

  create_table "deal_registers", force: :cascade do |t|
    t.daterange "available_range", null: false
    t.decimal "monto", null: false
    t.integer "max_cantidad", null: false
    t.bigint "product_sku_id", null: false
    t.bigint "deal_id_id", null: false
    t.index ["deal_id_id"], name: "index_deal_registers_on_deal_id_id"
    t.index ["product_sku_id"], name: "index_deal_registers_on_product_sku_id"
  end

  create_table "deals", force: :cascade do |t|
    t.integer "version", null: false
    t.boolean "vigencia", default: false, null: false
    t.bigint "deal_sku_id", null: false
    t.index ["deal_sku_id"], name: "index_deals_on_deal_sku_id"
  end

  create_table "entities", force: :cascade do |t|
    t.integer "tax_id", null: false
    t.string "name", null: false
  end

  create_table "invoice_registers", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "deal_register_id", null: false
    t.integer "quantity"
    t.decimal "sell_price"
    t.string "sp_currency_code"
    t.index ["deal_register_id"], name: "index_invoice_registers_on_deal_register_id"
    t.index ["product_id"], name: "index_invoice_registers_on_product_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "seller_id", null: false
    t.bigint "customer_id", null: false
    t.bigint "enduser_id", null: false
    t.string "agent_flag"
    t.string "partner_comment", null: false
    t.date "date", null: false
    t.string "sales_type", null: false
    t.string "record_type", null: false
    t.bigint "registers_id", null: false, array: true
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
    t.index ["enduser_id"], name: "index_invoices_on_enduser_id"
    t.index ["registers_id"], name: "index_invoices_on_registers_id"
    t.index ["seller_id"], name: "index_invoices_on_seller_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address1", null: false
    t.string "address2"
    t.string "city", null: false
    t.string "prov_code", null: false
    t.string "postal_code", null: false
    t.string "country_code", null: false
  end

  create_table "product_masters", force: :cascade do |t|
    t.string "SKU", null: false
    t.string "description"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "SKU_id", null: false
    t.string "option"
    t.string "origin", null: false
    t.string "serial_id"
    t.decimal "purchase_price", null: false
    t.string "pp_currency_code", null: false
    t.index ["SKU_id"], name: "index_products_on_SKU_id"
  end

  add_foreign_key "invoice_registers", "products"
end
