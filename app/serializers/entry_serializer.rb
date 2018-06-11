class EntrySerializer
  include FastJsonapi::ObjectSerializer
  attributes :journal_id, :character_id, :reward, :experience
end
