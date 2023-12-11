class EntitiesController < ApplicationController

  def index
    render :json => Entity.all
  end

  def show

  end

  def create
    entity = Entity.find_by(tax_id: params[:tax_id])

    if entity.blank? == false
      render :json => "Entity already exists", status: :forbidden
    else
      if entity.blank?

        location = Location.new( # TODO Hacer que se pueda agregar mas de un location al mismo tiempo.
          address1: params[:address1].upcase,
          address2: params[:address2].upcase,
          city: params[:city].upcase,
          prov_code: params[:prov_code].upcase,
          postal_code: params[:postal_code].upcase,
          country_code: params[:country_code].upcase
          )

        entity = Entity.new(tax_id: params[:tax_id], name: params[:name].upcase, locations: [location])
        if entity.save
          render :json => entity
        end
      else
        render :json => entity.errors, status: :unprocessable_entity
      end
    end
  end
end
