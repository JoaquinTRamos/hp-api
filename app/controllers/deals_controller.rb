class DealsController < ApplicationController

  def index
    render :json => DealMaster.all
  end

  def create

    dealmaster = DealMaster.find_by(deal_id: params[:deal_id])

    if dealmaster.blank?
      # Logica nuevo Deal

      dealmaster = DealMaster.new(deal_id: params[:deal_id], canal: params[:canal_types])

      dealmaster.deals.new(
        version: 1,
        vigencia: -> {params[:available_range] === Date.today}
      )

      new_deal = dealmaster.deals.last

      JSON.parse(params[:registers]).each do |register|
        puts register.class
        new_deal.deal_registers.new(
          product: ProductMaster.find_by(sku: register['sku']),
          monto: register['monto'],
          max_cantidad: register['max_cantidad'],
          available_range: Range.new(params[:start_date], params[:end_date])
        )
      end

      if dealmaster.save
        render :json => dealmaster
      else
        render :json => dealmaster.errors, status: :unprocessable_entity
      end

    else
      # Logica nueva Version

      old_deal = dealmaster.deals.last

      range = Range.new(params[:start_date], params[:end_date]).map { |date_str| Date.strptime(date_str, "%Y-%m-%d") }

      dealmaster.deals.new(
        version: old_deal.version + 1,
        vigencia: range.include?(Date.today)
      )

      new_deal = dealmaster.deals.last

      # Pasa multiples registros como JSON y por cada uno genera un registro en el resultado final

      JSON.parse(params[:registers]).each do |register|
        puts register.class
        new_deal.deal_registers.new(
          product: ProductMaster.find_by(sku: register['sku']),
          monto: register['monto'],
          max_cantidad: register['max_cantidad'],
          available_range: Range.new(params[:start_date], params[:end_date])
        )
      end

      if dealmaster.save
        old_deal.update_attribute(:vigencia, !range.include?(Date.today))
        render :json => dealmaster
      else
        render :json => dealmaster.errors, status: :unprocessable_entity
      end
    end

  end
end
