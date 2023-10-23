# frozen_string_literal: true

FactoryBot.define do
  factory :slot do
    day { Slot::DAYS.sample }
    start_hour { Faker::Time.backward(days: 1).strftime("%H:%M") }
    end_hour { Faker::Time.forward(days: 1).strftime("%H:%M") }

    association :address
  end
end
