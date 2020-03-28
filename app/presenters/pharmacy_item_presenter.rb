# frozen_string_literal: true

module PharmacyItemPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add 'pharmacy.name', as: :pharmacy_name
      t.add 'item.name', as: :item_name
      t.add 'item.item_type', as: :item_type
      t.add :count
    end

    api_accessible :index, extend: :base

    api_accessible :show, extend: :index
  end
end
