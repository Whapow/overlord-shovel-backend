class CampaignSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :gm_id
end
