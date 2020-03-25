# == Schema Information
#
# Table name: admins
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string           not null
#  password_digest :string
#  role            :integer          default(1), not null
#  status          :integer          default(1), not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Admin < ApplicationRecord
end
