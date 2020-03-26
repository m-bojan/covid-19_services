# frozen_string_literal: true

# == Schema Information
#
# Table name: pharmacies
#
#  id         :bigint           not null, primary key
#  latitude   :decimal(10, 8)   default(0.0), not null
#  location   :string
#  longitude  :decimal(10, 8)   default(0.0), not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  region_id  :bigint           not null
#
# Indexes
#
#  index_pharmacies_on_region_id           (region_id)
#  index_pharmacies_on_region_id_and_name  (region_id,name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (region_id => regions.id) ON DELETE => cascade
#
require 'test_helper'

class PharmacyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
