class InvoiceRegistersController < ApplicationController

  def show
    @registers = InvoiceRegister.where("invoice_id=?",params[:id])

    render :json => @registers
  end

end
