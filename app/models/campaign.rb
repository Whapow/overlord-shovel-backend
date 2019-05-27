# == Schema Information
#
# Table name: campaigns
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  gm_id        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  discarded_at :datetime
#

class Campaign < ApplicationRecord
  belongs_to :user, foreign_key: :gm_id
  
  has_many :characters
  has_many :inventories, as: :owner
  has_many :character_inventories, through: :characters, source: :inventory
  has_many :journals

  validates :gm_id, presence: true
  validates :name, presence: true

end
