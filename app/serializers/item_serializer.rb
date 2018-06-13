class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :character_id, :campaign_id, :name, :description, :value
end
