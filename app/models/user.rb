# == Schema Information
#
# Table name: users
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  email        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  discarded_at :datetime
#  display_name :string
#

class User < ApplicationRecord
  has_secure_password
  has_one :session
  has_many :characters, foreign_key: :player_id
  has_many :campaigns, foreign_key: :gm_id

  validates_presence_of :email, :username, :password_digest
  validates_uniqueness_of :username, :email
end
