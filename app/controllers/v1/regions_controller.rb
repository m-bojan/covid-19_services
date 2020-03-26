# frozen_string_literal: true

class V1::RegionsController < V1::BaseController
  skip_before_action :authenticate_user!, only: %i[index show]

  power :regions, map: {
    [:index] => :regions_index,
    [:show] => :regions_show,
    [:create] => :creatable_regions,
    [:update] => :updatable_regions,
    [:destroy] => :destroyable_regions
  }, as: :regions_scope

  ## ------------------------------------------------------------ ##

  # GET : /v1/regions/
  # Inherited from V1::BaseController
  # def index; end

  ## ------------------------------------------------------------ ##

  # POST : /v1/regions/
  # Inherited from V1::BaseController
  # def create; end

  ## ------------------------------------------------------------ ##

  # GET : /v1/regions/:id
  # Inherited from V1::BaseController
  # def show; end

  ## ------------------------------------------------------------ ##

  # PUT : /v1/regions/:id
  # Inherited from V1::BaseController
  # def update; end

  ## ------------------------------------------------------------ ##

  # DELETE : /v1/regions/:id
  # Inherited from V1::BaseController
  # def destroy; end

  ## ------------------------------------------------------------ ##

  private

  # Whitelist parameters
  def region_params
    params.require(:region).permit(:name, :city_id)
  end

  def search_params
    {
      id_eq: params[:id],
      name_cont: params[:name],
      city_id_eq: params[:city_id]
    }
  end
  # Custom ordering and sorting
  # def get_order; end
end
