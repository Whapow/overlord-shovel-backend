class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :character_id, :campaign_id, :name, :description, :value
end
