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
    params.require(:pharmacy).permit(:name, :address, :latitude, :location, :longitude, :region_id, :avatar)
  end

  def show_template
    :show
  end

  # the default index template
  def index_template
    :index
  end

  # Search filters
  def search_params
    {
      region_id_eq: params[:region_id],
      region_city_id_eq: params[:city_id],
      region_city_state_id_eq: params[:state_id],
      name_cont: params[:name]
    }
  end
  
  def build_collection(object = nil)
    result = (object || scope)
    result = result.ransack(search_params).result           if search_params.present?
    result = result.page(params[:page]).per(params[:limit]) if params[:limit] != '-1'
    result = order(result)
    result
  end

  def order(result)
    if sort == 'updated_at'
      result.joins(:pharmacy_items).order("pharmacy_items.updated_at #{direction}").uniq
    else
      result.order(sort.to_sym => direction)
    end
  end

  def sort
    return params[:sort] if %w[id created_at updated_at].include?(params[:sort])
    'created_at'
  end

  def direction
    params[:direction]&.to_sym || :desc
  end
end
