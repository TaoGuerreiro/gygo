# frozen_string_literal: true

# == Schema Information
#
# Table name: authorizations
#
#  id                  :bigint           not null, primary key
#  access_token        :string
#  access_token_secret :string
#  email               :string
#  expires             :boolean
#  expires_at          :date
#  provider            :string
#  refresh_token       :string
#  uid                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :bigint           not null
#
# Indexes
#
#  index_authorizations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
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
