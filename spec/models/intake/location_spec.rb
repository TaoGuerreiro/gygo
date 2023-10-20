# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Intake::Location, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of :address }
  end

  describe "#split_address" do
    context "with a valid address" do
      let(:address) { "12 Route De Saint-Fiacre, 44120 Vertou, France" }
      let(:location) { Intake::Location.new(address:) }
      let(:expected_result) do
        {
          address: address,
          line_1: "12 Route De Saint-Fiacre",
          postal_code: "44120",
          city: "Vertou",
          country: "France"
        }
      end

      it "splits the address correctly" do
        result = location.split_address
        expect(result).to eq expected_result
      end
    end
  end
end
