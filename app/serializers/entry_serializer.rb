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

class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :journal_id, :character_id, :reward, :experience
end
