# frozen_string_literal: true

class V1::PharmaciesController < V1::BaseController
  skip_before_action :authenticate_user!, only: %i[index show]
  power :pharmacies, map: {
    [:index] => :pharmacies_index,
    [:show] => :pharmacies_show,
    [:create] => :creatable_pharmacies,
    [:update] => :updatable_pharmacies,
    [:destroy] => :destroyable_pharmacies
  }, as: :pharmacies_scope

  ## ------------------------------------------------------------ ##

  # GET : /v1/pharmacies/
  # Inherited from V1::BaseController
  # def index; end

  ## ------------------------------------------------------------ ##

  # POST : /v1/pharmacies/
  # Inherited from V1::BaseController
  # def create; end

  ## ------------------------------------------------------------ ##

  # GET : /v1/pharmacies/:id
  # Inherited from V1::BaseController
  # def show; end

  ## ------------------------------------------------------------ ##

  # PUT : /v1/pharmacies/:id
  # Inherited from V1::BaseController
  # def update; end

  ## ------------------------------------------------------------ ##

  # DELETE : /v1/pharmacies/:id
  # Inherited from V1::BaseController
  # def destroy; end

  ## ------------------------------------------------------------ ##

  private

  # Whitelist parameters
  def pharmacy_params
    params.require(:pharmacy).permit(:name, :address, :latitude, :location, :longitude, :region_id)
  end

  def show_template
    :show
  end

  # the default index template
  def index_template
    :index
  end

  # Search filters
  # def search_params; end

  # Custom ordering and sorting
  # def get_order; end
end
