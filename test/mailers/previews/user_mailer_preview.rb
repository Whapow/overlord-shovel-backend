class UserMailerPreview < ActionMailer::Preview
  def password_reset_preview
    user = User.new(
      id: 999,
      first_name: 'Lorem',
      last_name: 'Ipsum',
      username: 'lorem',
      email: 'lorem.ipsum@overlord-shovel.com',
      reset_token: '1000000000000066600000000000001'
    )
    UserMailer.password_reset(user)
  end
end