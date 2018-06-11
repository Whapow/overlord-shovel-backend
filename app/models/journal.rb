# == Schema Information
#
# Table name: journals
#
#  id          :bigint(8)        not null, primary key
#  campaign_id :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Journal < ApplicationRecord
end