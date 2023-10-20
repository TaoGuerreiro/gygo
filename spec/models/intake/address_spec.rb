# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Intake::Address, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :phone }
    it { is_expected.to validate_presence_of :terms_of_service }
  end
end
