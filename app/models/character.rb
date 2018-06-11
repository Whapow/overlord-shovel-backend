# == Schema Information
#
# Table name: characters
#
#  id          :bigint(8)        not null, primary key
#  player_id   :integer
#  campaign_id :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Character < ApplicationRecord
end
