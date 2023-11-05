# frozen_string_literal: true

module Client
  class AddressesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_address, only: [:edit, :update]

    def edit; end

    def update
      if @address.update(address_params)
        flash[:notice] = 'Address updated successfully'
        redirect_to account_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def find_address
      @address = current_user.address
    end

    def address_params
      params.require(:address).permit(:address, :city, :comment, :country, :line_1, :line_2, :phone, :postal_code, :state)
    end
  end
end
