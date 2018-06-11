class JournalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :campaign_id
end
