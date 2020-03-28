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
  has_one_attached :avatar
  has_many :pharmacy_items
  has_many :items, through: :pharmacy_items

  validates :name, presence: true
  validates :region_id, presence: true

  validates :location, presence: true
  validates_uniqueness_of :name, scope: :region_id, message: 'لا يمكن تكرار نفس الصيدلية بنفس المنطقة'

  def facemask_count
    found_items.find_all { |i| i[:type] == 'facemask' }.pluck(:count).sum
  end

  def gloves_count
    found_items.find_all { |i| i[:type] == 'gloves' }.pluck(:count).sum
  end

  def sterile_count
    found_items.find_all { |i| i[:type] == 'sterile' }.pluck(:count).sum
  end

  def found_items
    cached_items.map { |ph| { type: ph.item_type, count: ph.count } }
  end

  def last_update
    return unless cached_items.last

    cached_items.last.updated_at
  end

  def cached_items
    @cached_items ||= pharmacy_items
  end

  def city_id
    region.city_id
  end

  def state_id
    region.city.state_id
  end
  def avatar_url
    avatar.attached? ? [CONSTANT[:url], url].compact.join : CONSTANT[:default_image]
  end

  def url
    Rails.application.routes.url_helpers.rails_blob_path(avatar, only_path: true)
  end
end
