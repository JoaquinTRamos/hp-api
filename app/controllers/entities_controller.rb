class EntitiesController < ApplicationController

  def index
    render :json => Entity.all
  end

  def show
    entity = Entity.find_by(tax_id: params[:tax_id])

    if entity.blank? == false
      render :json => entity
    else
      render :json => nil
    end
  end

  def create
    entity = Entity.find_by(tax_id: params[:tax_id])

    if entity.blank? == false
      render :json => "Entity already exists", status: :forbidden
    else
      if entity.blank?

        locations = []
        JSON.parse(params[:locations]).each do |location|
          puts location
          loc = Location.new(
            address1: location['address1'].upcase,
            address2: if location['address2'] != nil then location['address2'].upcase else nil end,
            city: location['city'].upcase,
            prov_code: location['prov_code'].upcase,
            postal_code: location['postal_code'],
            country_code: location['country_code'].upcase
          )

          locations.append(loc)
        end

        entity = Entity.new(tax_id: params[:tax_id], name: params[:name].upcase, locations: locations)
        if entity.save
          render :json => entity
        end
      else
        render :json => entity.errors, status: :unprocessable_entity
      end
    end
  end
end
