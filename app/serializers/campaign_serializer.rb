# == Schema Information
#
# Table name: campaigns
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  gm_id        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  discarded_at :datetime
#

class CampaignSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :gm_id
end
