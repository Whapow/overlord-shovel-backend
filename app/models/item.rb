# == Schema Information
#
# Table name: items
#
#  id           :bigint(8)        not null, primary key
#  campaign_id  :integer
#  character_id :integer
#  name         :string
#  description  :string
#  value        :decimal(9, 2)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  discarded_at :datetime
#

class Item < ApplicationRecord
end
