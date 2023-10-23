require 'rails_helper'

RSpec.describe "Subscriptions::Confirmations", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get '/subscriptions/confirmation'

      expect(response).to have_http_status(200)
    end
  end
end
