class InvoiceRegistersController < ApplicationController

  def show
    @registers = InvoiceRegister.where("invoice_id=?", Invoice.find_by(invoice_id: params[:id]))

    render :json => @registers
  end

  def find_register_by_product_serial_id

    product = Product.where(serial_id: params[:serial_id]).last

    render :json => InvoiceRegister.find_by(product_id: product.id)

  end

end
