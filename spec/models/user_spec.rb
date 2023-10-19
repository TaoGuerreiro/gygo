require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user, first_name: "Alice", last_name: " Liddell ") }

  it "create and persist a user" do
    expect(subject).to be_valid
  end

  describe "associations" do
    it { is_expected.to have_many(:authorizations).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  it "expected to be valid with an email, a password, and to be able to authenticate" do
    expect(subject.active_for_authentication?).to be true
  end
end
