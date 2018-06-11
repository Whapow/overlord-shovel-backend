class CharacterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :player_id, :campaign_id, :name
end
