# == Schema Information
#
# Table name: entries
#
#  id           :bigint(8)        not null, primary key
#  character_id :bigint(8)
#  journal_id   :bigint(8)
#  reward       :decimal(9, 2)
#  experience   :integer
#

class Entry < ApplicationRecord
  belongs_to :journal
  belongs_to :character

  validates :journal_id, presence: true
  validates :character_id, presence: true
end
