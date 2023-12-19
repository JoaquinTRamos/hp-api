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

    invoice = Invoice.find_by(invoice_id: params[:invoice_id])
    repeated_invoice = false

    if !invoice.nil?
      render :json => "Invoice already exists", status: :forbidden
      repeated_invoice = true
    end

    if !repeated_invoice
      invoice = Invoice.new(
        seller: Entity.find_by(tax_id: params[:seller_id]),
        customer: Entity.find_by(tax_id: params[:customer_id]),
        enduser: if params[:agent_flag] == "" then nil else Entity.find_by(tax_id: params[:enduser_id]) end,
        agent_flag: params[:agent_flag],
        partner_comment: params[:partner_comment],
        date: params[:date],
        sales_type: params[:sales_type],
        record_type: params[:record_type],
        invoice_id: params[:invoice_id]
      )

      msg = {}
      registers = []
      ids = []
      repeat_id = false
      error = false

      JSON.parse(params[:registers]).each do |register|
        temp = Product.find(register['id'])

        if temp.blank?
          render :json => String(register['id']) + " has no product register.", status: :forbidden
          break
        end

        if ids.include? register['id']
          repeat_id = true
          render :json => String(register['id']) + " has been repeated in invoice registers", status: :forbidden
          break
        end

        if !InvoiceRegister.find_by(product_id: register['id']).nil?
          repeat_id = true
          render :json => String(register['id']) + " has been repeated in invoice registers", status: :forbidden
          break
        end

        new_register = invoice.invoice_registers.new(
          product: temp,
          deal_register: DealsController.find_deal(temp.product_master.id), #Function to verify if product has deal
          quantity: register['quantity'],
          sell_price: register['sell_price'],
          sp_currency_code: register['currency_code'],
          invoice_id: invoice.id
        )

        registers.append(new_register)
        ids.append(register['id'])
      end

      if !repeat_id
        registers.each do |new_register|
          if new_register.save
            msg[new_register.id] = new_register
          else
            render :json => new_register.errors, status: :unprocessable_entity
            error = true
            break
          end
        end
      end

      if !error and !repeat_id and invoice.save
        render :json => invoice
      elsif !error and !repeat_id and !invoice.save
        render :json => "Unable to save Invoice", status: :unprocessable_entity
      end
    end
  end
end
