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
      new_prods = []
      errors = false
      repeat = false

      JSON.parse(params[:registers]).each do |register|

        temp = Product.find_by(serial_id: register['serial_id'])

        if !temp.nil? and !(other_ids.include? nil) and !temp.serial_id.nil?
          repeat = true
          break
        end

        new_product = productMaster.products.new(
          option: if register['option'] == "" then nil else register['option'] end,
          origin: register['origin'],
          serial_id: register['serial_id'],
          purchase_price: register['purchase_price'],
          pp_currency_code: register['currency_code']
        )

        new_prods.append(new_product)

        if !register['serial_id'].nil?
          other_ids.append(register['serial_id'])
        end

      end

      if !repeat and !errors
        new_prods.each do |new_product|
          if new_product.save
            msg[new_product.id] = new_product
          else
            render :json => new_product.errors, status: :unprocessable_entity
            errors = true
            break
          end
        end
      end

      if !repeat and !errors
        render :json => msg
      elsif repeat and !errors
        render :json => "Repeated Serial ID", status: :forbidden
      end
    end
  end
end
