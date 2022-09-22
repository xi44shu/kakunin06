FactoryBot.define do
  factory :user do
   name              { '田なカ' }
   admin              { 'false' }
   email                 {Faker::Internet.free_email}
   password              {Faker::Internet.password(min_length: 6)}
   password_confirmation {password}
  end
 end
