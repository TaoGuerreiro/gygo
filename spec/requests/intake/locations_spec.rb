# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Intake::LocationsController do
  let(:valid_location_params) { { 'intake_location' => { 'address' => '123 Main St' } } }
  let(:invalid_location_params) { { 'intake_location' => { 'address' => nil } } }

  describe 'GET #new' do
    it 'renders the new template' do
      get '/intake/locations/new'

      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it 'redirects to new_intake_address_path with valid location' do
      post '/intake/locations', params: valid_location_params

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(new_intake_address_path)
      expect(session[:location]['address']).to eq('123 Main St')
    end

    it 'renders the new template with invalid location' do
      post '/intake/locations', params: invalid_location_params

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
