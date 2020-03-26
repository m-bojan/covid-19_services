# frozen_string_literal: true

# == Schema Information
#
# Table name: admins
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string           not null
#  password_digest :string
#  role            :integer          default("admin"), not null
#  status          :integer          default("active"), not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Admin < ApplicationRecord
  include AdminPresenter
  has_secure_password(validations: false)
  scope :active, -> { where(status: 1) }

  extend Enumerize
  enumerize :status, in: {
    active: 1,
    inactive: 2
  }, default: :active, scope: true, predicates: true

  enumerize :role, in: {
    admin: 1,
    super_admin: 2
  }, default: :admin, scope: true, predicates: true

  validates :name, presence: true
  validates :username, presence: true
  validates :password,
            presence: true,
            length: { minimum: 8 },
            allow_blank: { on: :update }
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def self.login(username:, password:)
    user = find_by(username: username.downcase)
    return false if user.blank? || user.password_digest.nil?

    user.authenticate(password) || false
  end

  def payload
    {
      id: id,
      name: name,
      email: email,
      username: username
    }
  end
end
