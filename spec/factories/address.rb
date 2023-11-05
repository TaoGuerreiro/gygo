# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    address { Faker::Address.street_address }
    line_1 { Faker::Address.street_address }
    postal_code { Faker::Address.zip_code }
    city { Faker::Address.city }
    country { Faker::Address.country }
    phone { Faker::PhoneNumber.phone_number }
    state { Faker::Address.state }
    terms_of_service { "1" }
    comment { Faker::Lorem.sentence }

    association :user
  end
end
