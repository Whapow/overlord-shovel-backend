class SessionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :token, :user_id
  belongs_to :user
end
