# frozen_string_literal: true

module PharmacyItemPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :pharmacy_id
      t.add :item_id
      t.add :count
      t.add :created_at
      t.add :updated_at
    end

    api_accessible :index, extend: :base

    api_accessible :show, extend: :index
  end
end
