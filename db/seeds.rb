User.find_or_create_by!(email: 'sample@sample.com') do |user|
  name: 'admin',
  email: 'sample@sample.com',
  admin: true,
  password: 'password',
  password_confirmation: 'password'
end