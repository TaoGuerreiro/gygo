# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client::AccountController, type: :request do
  let(:user) { create(:user) }

  before do
    address = create(:address, user:)
    create(:slot, address:)
    sign_in(user)
  end

  describe "GET /show" do
    it "returns http success" do
      get "/account"

      expect(response).to have_http_status(200)
    end
  end
end
