FactoryBot.define do
  factory :user, class: User do
    sequence(:id, "n")
    sequence(:name, "name_1")
    email { Faker::Internet.free_email }
    sequence(:password_digest, "pass_1")
  end

  factory :task, class: Task do
    sequence(:id, "n")
    name { 'タスク' }
    contents {'タスクの内容'}
    sequence(:deadline) { |n| (Time.zone.today + n.days).to_s }
    priority { 1 }
    status { 1 }
    user
  end
end
