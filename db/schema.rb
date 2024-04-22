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

ActiveRecord::Schema[7.1].define(version: 2024_04_17_141312) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "canal_types", ["DISTRIBUCION", "Online", "BNA", "CIUDAD"]

  create_table "application_records", force: :cascade do |t|
    t.datetime "updated_at", null: false
    t.datetime "created_at", precision: nil
  end

  create_table "deal_masters", force: :cascade do |t|
    t.integer "deal_id"
    t.enum "canal", null: false, array: true, enum_type: "canal_types"
    t.string "canal_types"
  end

  create_table "deal_registers", force: :cascade do |t|
    t.daterange "available_range", null: false
    t.decimal "monto", null: false
    t.integer "max_cantidad", null: false
    t.bigint "deal_id"
    t.bigint "product_id"
  end

  create_table "deals", force: :cascade do |t|
    t.integer "version", null: false
    t.boolean "vigencia", default: false, null: false
    t.bigint "deal_master_id"
  end

  create_table "entities", force: :cascade do |t|
    t.bigint "tax_id", null: false
    t.string "name", null: false
  end

  create_table "entities_locations", id: false, force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "entity_id", null: false
    t.index ["entity_id"], name: "index_entities_locations_on_entity_id"
    t.index ["location_id"], name: "index_entities_locations_on_location_id"
  end

  create_table "impacts", force: :cascade do |t|
    t.datetime "impacted_at", null: false
  end

  create_table "invoice_registers", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "deal_register_id"
    t.integer "quantity"
    t.decimal "sell_price"
    t.string "sp_currency_code"
    t.bigint "invoice_id"
    t.index ["deal_register_id"], name: "index_invoice_registers_on_deal_register_id"
    t.index ["product_id"], name: "index_invoice_registers_on_product_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "seller_id", null: false
    t.bigint "customer_id", null: false
    t.bigint "enduser_id"
    t.string "agent_flag"
    t.string "partner_comment", null: false
    t.date "date", null: false
    t.string "sales_type", null: false
    t.string "record_type", null: false
    t.string "invoice_id", null: false
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
    t.index ["enduser_id"], name: "index_invoices_on_enduser_id"
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
    t.string "sku", null: false
    t.string "description"
    t.boolean "is_active", null: false
    t.string "business_unit", null: false
    t.string "category", null: false
    t.string "subcategory", null: false
    t.string "category_gfast", null: false
    t.string "brand", null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "product_master_id", null: false
    t.string "option"
    t.string "origin", null: false
    t.string "serial_id"
    t.decimal "purchase_price", null: false
    t.string "pp_currency_code", null: false
    t.index ["product_master_id"], name: "index_products_on_product_master_id"
  end

  add_foreign_key "invoice_registers", "products"
end
