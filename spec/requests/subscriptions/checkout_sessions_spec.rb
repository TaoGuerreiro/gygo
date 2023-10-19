# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Subscriptions::CheckoutSessionsController do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get '/subscriptions/checkout_session'

      expect(response).to have_http_status(200)
    end
  end
end
