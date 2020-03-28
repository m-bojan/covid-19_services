# frozen_string_literal: true

class V1::PharmacyItemsController < V1::BaseController
  power :pharmacy_items, map: {
    [:index]   => :pharmacy_items_index,
    [:show]    => :pharmacy_items_show,
    [:create] => :creatable_pharmacy_items,
    [:update] => :updatable_pharmacy_items
    # [:destroy] => :destroyable_pharmacy_items
  }, as: :pharmacy_items_scope

  ## ------------------------------------------------------------ ##

  # GET : /v1/pharmacy_items/
  # Inherited from V1::BaseController
  # def index; end

  ## ------------------------------------------------------------ ##

  # POST : /v1/pharmacy_items/
  # Inherited from V1::BaseController
  # def create; end

  ## ------------------------------------------------------------ ##

  # GET : /v1/pharmacy_items/:id
  # Inherited from V1::BaseController
  # def show; end

  ## ------------------------------------------------------------ ##

  # PUT : /v1/pharmacy_items/:id
  # Inherited from V1::BaseController
  # def update; end

  ## ------------------------------------------------------------ ##

  # DELETE : /v1/pharmacy_items/:id
  # Inherited from V1::BaseController
  # def destroy; end

  ## ------------------------------------------------------------ ##

  private

  # Whitelist parameters
  def pharmacy_item_params
    params.require(:pharmacyitem).permit(:count, :item_id, :pharmacy_id)
  end

  # Search filters
  # def search_params; end

  # Custom ordering and sorting
  # def get_order; end
end
