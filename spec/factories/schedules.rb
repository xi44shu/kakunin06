FactoryBot.define do
  factory :schedule do
    scheduled_date { Faker::Date.backward }       
    time_zone_id { '2' }       
    accuracy_id { '2' }        
    size_id { '2' }            
    mie_id { '2' }             
    first_contact_id { '2' }   
    content          { Faker::Lorem.sentence }
    association :user
    association :team
  end
end
