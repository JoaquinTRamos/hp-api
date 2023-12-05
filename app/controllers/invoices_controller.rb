class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all

    msg = {}

    @invoices.each do |invoice|
      msg[invoice.id] = invoice
    end

    render :json => msg
  end

  def show
    @invoice = Invoice.find(params[:id])

    render :json => @invoice
  end
end
