class ProductsController < ApplicationController

  def index
    render :json => ProductMaster.all
  end

  def create_master
    productMaster = ProductMaster.new(sku: params[:sku], description: params[:description])

    if productMaster.save
      render :json => productMaster
    else
      render :json => productMaster.errors, status: :unprocessable_entity
    end
  end

  def create_instance
    productMaster = ProductMaster.find_by(sku: params[:sku])

    if productMaster.blank?
      render :json => "No Product Master found", status: :forbidden
    else

      msg = {}
      other_ids = []
      repeated_serial_id = false

      JSON.parse(params[:registers]).each do |register|

        temp = Product.find_by(serial_id: register['serial_id'])

        if !temp.blank? or register['serial_id'] === other_ids # If serial_id exists in DB OR serial_id is repeated in previous registers being created.
          repeated_serial_id = true
          break
        end

        new_product = productMaster.products.new(
          option: if register['option'] == "" then nil else register['option'] end,
          origin: register['origin'],
          serial_id: register['serial_id'],
          purchase_price: register['purchase_price'],
          pp_currency_code: register['currency_code']
        )

        if new_product.save
          msg[new_product.id] = new_product
        else
          render :json => new_product.errors, status: :unprocessable_entity
          break

        other_ids.append(register['serial_id'])
        end

      end

      if !repeated_serial_id
        render :json => msg
      else
        render :json => "Repeated Serial ID", status: :forbidden
      end
    end
  end
end
