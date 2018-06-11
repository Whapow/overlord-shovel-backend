class CampaignSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :gm_id
end
