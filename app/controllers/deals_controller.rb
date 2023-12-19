class DealsController < ApplicationController

  def index
    render :json => DealMaster.all
  end

  def self.find_deal(sku)

    result = nil
    Deal.all.each do |deal|
      if deal.vigencia == true
        deal.deal_registers.each do |register|
          if register.product_id == sku
            result = register
          end
        end
      end
    end

    return result
  end

  def create

    dealmaster = DealMaster.find_by(deal_id: params[:deal_id])

    if dealmaster.blank?

      canal_enum_array = JSON.parse(params[:canal_types])

      # Logica nuevo Deal
      dealmaster = DealMaster.new(deal_id: params[:deal_id], canal: canal_enum_array)


      dealmaster.deals.new(
        version: 1,
        vigencia: -> {Range.new(params[:start_date], params[:end_date]) === Date.today}
      )

      new_deal = dealmaster.deals.last

      JSON.parse(params[:registers]).each do |register|
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

  def update_database
    @deal_masters = DealMaster.joins(:deals).where(deals: {vigencia: true}).distinct

    @deal_masters.each do |dm|
      current_deal = Deal.find(dm.deals.where(vigencia: true))
      next_deal = Deal.find_by(version: current_deal.version + 1)

      update_version = true

      next_deal.deal_registers.each do |register|
        if !register.available_range.include? Date.today
          update_version = false
          break
        end
      end

      if update_version
        next_deal.vigencia = true
        next_deal.save
        current_deal.vigencia = false
        current_deal.save
      end
    end
  end
end
