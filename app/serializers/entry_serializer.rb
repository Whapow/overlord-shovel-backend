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

class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :journal_id, :character_id, :reward, :experience
end
