# frozen_string_literal: true

class V1::StatesController < V1::BaseController
  skip_before_action :authenticate_user!, only: %i[index show]

  power :states, map: {
    [:index] => :states_index,
    [:show] => :states_show,
    [:create] => :creatable_states,
    [:update] => :updatable_states,
    [:destroy] => :destroyable_states
  }, as: :states_scope

  ## ------------------------------------------------------------ ##

  # GET : /v1/states/
  # Inherited from V1::BaseController
  # def index; end

  ## ------------------------------------------------------------ ##

  # POST : /v1/states/
  # Inherited from V1::BaseController
  # def create; end

  ## ------------------------------------------------------------ ##

  # GET : /v1/states/:id
  # Inherited from V1::BaseController
  # def show; end

  ## ------------------------------------------------------------ ##

  # PUT : /v1/states/:id
  # Inherited from V1::BaseController
  # def update; end

  ## ------------------------------------------------------------ ##

  # DELETE : /v1/states/:id
  # Inherited from V1::BaseController
  # def destroy; end

  ## ------------------------------------------------------------ ##

  private

  # Whitelist parameters
  def state_params
    params.require(:state).permit(:name)
  end

  # Search filters
  def search_params
    {
      id_eq: params[:id],
      name_cont: params[:name]
    }
  end

  # Custom ordering and sorting
  # def get_order; end
end
