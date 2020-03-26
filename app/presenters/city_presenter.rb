# frozen_string_literal: true

module CityPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :state_id
      t.add :name
    end

    api_accessible :index, extend: :base

    api_accessible :show, extend: :index
  end
end
