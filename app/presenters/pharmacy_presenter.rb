# frozen_string_literal: true

module PharmacyPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :region_id
      t.add :name
      t.add :location
      t.add :longitude
      t.add :latitude
      t.add :created_at
      t.add :updated_at
    end

    api_accessible :index, extend: :base

    api_accessible :show, extend: :index
  end
end
