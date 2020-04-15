User.find_or_create_by!(email: 'sample@sample.com') do |user|
  user.name = 'sample',
  user.admin = true,
  user.password = 'password',
  user.password_confirmation = 'password'
end