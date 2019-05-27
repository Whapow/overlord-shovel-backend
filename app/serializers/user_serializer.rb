# == Schema Information
#
# Table name: users
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  email        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  discarded_at :datetime
#  display_name :string
#

class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username, :first_name, :last_name, :email
  has_many :characters
end
