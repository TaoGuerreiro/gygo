require 'rails_helper'

RSpec.describe Client::AddressesController, type: :request do
  let(:user) { create(:user) }
  let(:valid_address_params) { { 'address' => { 'address' => '123 Main St' } } }
  let(:invalid_address_params) { { 'address' => { 'address' => nil } } }
  let(:address) { create(:address, user:) }

  before do
    sign_in(user)
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/client/addresses/#{address.id}/edit"
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH #update' do
    it 'redirects to client_account_path with valid location' do
      patch "/client/addresses/#{address.id}", params: valid_address_params

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(client_account_path)
    end

    it 'renders the edit template with invalid location' do
      patch "/client/addresses/#{address.id}", params: invalid_address_params

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
