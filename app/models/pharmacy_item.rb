# frozen_string_literal: true

# == Schema Information
#
# Table name: pharmacy_items
#
#  id          :bigint           not null, primary key
#  count       :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  item_id     :bigint           not null
#  pharmacy_id :bigint           not null
#
# Indexes
#
#  index_pharmacy_items_on_item_id                  (item_id)
#  index_pharmacy_items_on_pharmacy_id              (pharmacy_id)
#  index_pharmacy_items_on_pharmacy_id_and_item_id  (pharmacy_id,item_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id) ON DELETE => cascade
#  fk_rails_...  (pharmacy_id => pharmacies.id) ON DELETE => cascade
#
class PharmacyItem < ApplicationRecord
  include PharmacyItemPresenter
  belongs_to :pharmacy
  belongs_to :item
  delegate :item_type, to: :item, prefix: false, allow_nil: true
  validates_uniqueness_of :pharmacy_id, scope: :item_id, message: 'لايمكن ان تتكرر نفس العنصر لنفس الصيدلية'
end
