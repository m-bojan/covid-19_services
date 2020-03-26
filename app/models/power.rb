# frozen_string_literal: true

class Power
  include Consul::Power

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def super_admin?
    @user.present? && @user.super_admin?
  end

  ActiveRecord::Base.connection.tables.map(&:to_sym) - %i[schema_migrations ar_internal_metadata].each do |model|
    power model do
      false
    end
  end

  power :sign_in do
    true
  end

  ######################## V1::CitiesController #######################

  power :cities_index do
    City
  end

  power :cities_show do
    City
  end

  power :creatable_cities do
    return City if super_admin?

    powerless!
  end

  power :updatable_cities do
    return City if super_admin?

    powerless!
  end

  power :destroyable_cities do
    return City if super_admin?

    powerless!
  end

  ######################## V1::StatesController #######################

  power :states_index do
    State
  end

  power :states_show do
    State
  end

  power :creatable_states do
    return State if super_admin?

    powerless!
  end

  power :updatable_states do
    return State if super_admin?

    powerless!
  end

  power :destroyable_states do
    return State if super_admin?

    powerless!
  end

  ######################## V1::RegionsController #######################

  power :regions_index do
    Region
  end

  power :regions_show do
    Region
  end

  power :creatable_regions do
    return Region if super_admin?

    powerless!
  end

  power :updatable_regions do
    return Region if super_admin?

    powerless!
  end

  power :destroyable_regions do
    return Region if super_admin?

    powerless!
  end

  ######################## V1::PharmaciesController #######################

  power :pharmacies_index do
    Pharmacy
  end

  power :pharmacies_show do
    Pharmacy
  end

  power :creatable_pharmacies do
    Pharmacy
  end

  power :updatable_pharmacies do
    Pharmacy
  end

  power :destroyable_pharmacies do
    Pharmacy
  end

  ######################## V1::ItemsController #######################

  power :items_index do
    Item
  end

  power :items_show do
    Item
  end

  power :creatable_items do
    Item
  end

  power :updatable_items do
    Item
  end

  power :destroyable_items do
    Item
  end
end
