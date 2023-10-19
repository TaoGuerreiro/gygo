require "rails_helper"

RSpec.describe Authorization, type: :model do
  let(:user) { create(:user) }

  it "is valid with a unique combination of uid and provider" do
    authorization = Authorization.new(user: user, uid: "unique_uid", provider: "unique_provider")
    expect(authorization).to be_valid
  end

  it "is not valid with a non-unique combination of uid and provider" do
    Authorization.create(user: user, uid: "duplicate_uid", provider: "duplicate_provider")
    duplicate_authorization = Authorization.new(user: user, uid: "duplicate_uid", provider: "duplicate_provider")
    expect(duplicate_authorization).not_to be_valid
  end

  it "is valid when uid is the same, but provider is different" do
    Authorization.create(user: user, uid: "common_uid", provider: "provider1")
    authorization = Authorization.new(user: user, uid: "common_uid", provider: "provider2")
    expect(authorization).to be_valid
  end
end
