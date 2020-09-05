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

class Inventory < ApplicationRecord
  before_save :set_default_name

  belongs_to :owner, polymorphic: true
  has_many :stacks

  private
  
  def set_default_name
    self.name ||= "#{self.owner.name}'s #{ self.owner_type == "Campaign" ? 'ShinyPile' : 'Inventory'}"
  end 
end
