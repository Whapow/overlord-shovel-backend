# == Schema Information
#
# Table name: inventories
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  owner_type :string
#  owner_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class IventorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :owner_id, :owner_type, :name
  has_many :item_slots
end
