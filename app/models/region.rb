# frozen_string_literal: true

# == Schema Information
#
# Table name: regions
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city_id    :bigint           not null
#
# Indexes
#
#  index_regions_on_city_id  (city_id)
#  index_regions_on_name     (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (city_id => cities.id) ON DELETE => cascade
#
class Region < ApplicationRecord
  include RegionPresenter
  belongs_to :city
  has_many :pharmacies
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
