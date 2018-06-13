class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :journal_id, :character_id, :reward, :experience
end
