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
class Pharmacy < ApplicationRecord
  include PharmacyPresenter
  belongs_to :region

  validates :name, presence: true
  validates :region_id, presence: true

  validates :location, presence: true
  validates_uniqueness_of :name, scope: :region_id, message: 'لا يمكن تكرار نفس الصيدلية بنفس المنطقة'
end
