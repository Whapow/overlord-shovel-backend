# == Schema Information
#
# Table name: characters
#
#  id           :bigint(8)        not null, primary key
#  player_id    :integer
#  campaign_id  :integer
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  discarded_at :datetime
#

class Character < ApplicationRecord
  belongs_to :campaign, optional: true
  belongs_to :user, foreign_key: :player_id
  has_many :items
  has_many :journals, through: :entries

  validates :campaign_id, presence: true
  validates :player_id, presence: true
  validates :name, presence: true


end
