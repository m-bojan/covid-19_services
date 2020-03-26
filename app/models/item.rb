# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  description :text
#  item_type   :integer          not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_items_on_name  (name) UNIQUE
#
class Item < ApplicationRecord
  include ItemPresenter
  has_many :pharmacy_items
  extend Enumerize
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :item_type, presence: true

  enumerize :item_type, in: {
    facemask: 1,
    gloves: 2,
    sterile: 3
  }, scope: true, predicates: true
end
