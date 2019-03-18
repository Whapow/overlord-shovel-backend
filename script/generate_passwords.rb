User.where(password_digest: nil).each do |user|
  temporary_password = user.username + "123"
  user.update(password: temporary_password)
end