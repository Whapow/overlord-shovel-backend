# == Schema Information
#
# Table name: items
#
#  id           :bigint(8)        not null, primary key
#  campaign_id  :integer
#  character_id :integer
#  name         :string
#  description  :string
#  value        :decimal(9, 2)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  discarded_at :datetime
#

class Item < ApplicationRecord
  belongs_to :campaign
  belongs_to :character, optional: true

  validates :campaign_id, presence: true
  validates :name, presence: true
  validates :value, presence: true
end
