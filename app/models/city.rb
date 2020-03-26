# frozen_string_literal: true

# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  state_id   :bigint           not null
#
# Indexes
#
#  index_cities_on_name      (name) UNIQUE
#  index_cities_on_state_id  (state_id)
#
# Foreign Keys
#
#  fk_rails_...  (state_id => states.id) ON DELETE => cascade
#
class City < ApplicationRecord
  include CityPresenter
  has_many :regions
  belongs_to :state
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
