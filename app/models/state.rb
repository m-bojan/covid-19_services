# frozen_string_literal: true

# == Schema Information
#
# Table name: states
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_states_on_name  (name) UNIQUE
#
class State < ApplicationRecord
  include StatePresenter
  has_many :cities
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
