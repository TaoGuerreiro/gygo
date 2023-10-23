# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  city             :string
#  comment          :string
#  country          :string
#  line_1           :string
#  line_2           :string
#  phone            :string
#  postal_code      :string
#  state            :string
#  terms_of_service :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Address < ApplicationRecord
  belongs_to :user
  has_one :slot, dependent: :destroy
  accepts_nested_attributes_for :slot
end
