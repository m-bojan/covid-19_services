# frozen_string_literal: true

module AdminPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :name
      t.add :username
      t.add :password_digest
      t.add :role
      t.add :status
      t.add :email
      t.add :created_at
      t.add :updated_at
    end

    api_accessible :index, extend: :base

    api_accessible :show, extend: :index
  end
end
