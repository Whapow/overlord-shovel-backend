class CharacterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :player_id, :campaign_id, :name
end
