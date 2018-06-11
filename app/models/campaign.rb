# == Schema Information
#
# Table name: campaigns
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  gm_id      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Campaign < ApplicationRecord
end
