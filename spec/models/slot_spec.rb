# == Schema Information
#
# Table name: slots
#
#  id         :bigint           not null, primary key
#  day        :string
#  end_hour   :string
#  start_hour :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  address_id :bigint           not null
#
# Indexes
#
#  index_slots_on_address_id  (address_id)
#
# Foreign Keys
#
#  fk_rails_...  (address_id => addresses.id)
#
require 'rails_helper'

RSpec.describe Slot, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:address) }
  end
end
