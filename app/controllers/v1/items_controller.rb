# frozen_string_literal: true

class V1::ItemsController < V1::BaseController
  skip_before_action :authenticate_user!, only: %i[index show]

  power :items, map: {
    [:index]   => :items_index,
    [:show]    => :items_show,
    [:create]  => :creatable_items,
    [:update]  => :updatable_items,
    [:destroy] => :destroyable_items
  }, as: :items_scope

  ## ------------------------------------------------------------ ##

  # GET : /v1/items/
  # Inherited from V1::BaseController
  # def index; end

  ## ------------------------------------------------------------ ##

  # POST : /v1/items/
  # Inherited from V1::BaseController
  # def create; end

  ## ------------------------------------------------------------ ##

  # GET : /v1/items/:id
  # Inherited from V1::BaseController
  # def show; end

  ## ------------------------------------------------------------ ##

  # PUT : /v1/items/:id
  # Inherited from V1::BaseController
  # def update; end

  ## ------------------------------------------------------------ ##

  # DELETE : /v1/items/:id
  # Inherited from V1::BaseController
  # def destroy; end

  ## ------------------------------------------------------------ ##

  private

  # Whitelist parameters
  def item_params
    params.require(:item).permit(:description, :item_type, :name)
  end

  # Search filters
  # def search_params; end

  # Custom ordering and sorting
  # def get_order; end
end
