# == Schema Information
#
# Table name: addresses
#
#  id               :bigint           not null, primary key
#  address          :string
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
require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end
end
