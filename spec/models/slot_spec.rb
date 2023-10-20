require 'rails_helper'

RSpec.describe Slot, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:address) }
  end
end
