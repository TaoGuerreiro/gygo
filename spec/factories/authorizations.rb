# frozen_string_literal: true

FactoryBot.define do
  factory :authorization do
    provider { "MyString" }
    uid { "MyString" }
    refresh_token { "MyString" }
    access_token { "MyString" }
    access_token_secret { "MyString" }
    expires_at { "2023-10-12 12:10:06" }

    association :user
  end
end
