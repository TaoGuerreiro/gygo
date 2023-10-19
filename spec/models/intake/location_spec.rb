# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Intake::Location, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :address }
  end
end
