class SessionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :token, :user_id
end
