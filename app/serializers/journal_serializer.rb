class JournalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :campaign_id
end
