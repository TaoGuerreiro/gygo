# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar_url             :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user, first_name: "Alice", last_name: " Liddell ") }

  it "create and persist a user" do
    expect(subject).to be_valid
  end

  describe "associations" do
    it { is_expected.to have_many(:authorizations).dependent(:destroy) }
    it { is_expected.to have_one(:address).dependent(:destroy) }
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
