# == Schema Information
#
# Table name: entries
#
#  journal_id   :bigint(8)        not null
#  character_id :bigint(8)        not null
#  experience   :integer
#  reward       :decimal(, )
#  discarded_at :datetime
#

class Entry < ApplicationRecord
  belongs_to :journal
  belongs_to :character

  validates :journal_id, presence: true
  validates :character_id, presence: true
end
