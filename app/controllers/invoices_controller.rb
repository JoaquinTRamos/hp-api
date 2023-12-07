class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all

    render :json => @invoices
  end

  def show
    @invoice = Invoice.find(params[:id])

    render :json => @invoice
  end

  def create

  end
end
