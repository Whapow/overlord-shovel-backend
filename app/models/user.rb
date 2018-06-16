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
  has_many :characters
  has_many :campaigns

  validates :name, presence: true
  validates :display_name, presence: true
  validates :email, presence: true
end
