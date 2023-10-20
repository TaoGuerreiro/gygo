# frozen_string_literal: true

module Intake
  class AddressesController < ApplicationController
    def new
      @address = Intake::Address.new
    end

    def create
      @address = Intake::Address.new(address_params)

      if @address.valid?
        address_attributes

        redirect_to new_intake_slot_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def address_attributes
      session[:registration].merge!(
        phone: @address.phone,
        line_2: @address.floor,
        comment: @address.comment,
        terms_of_service: @address.terms_of_service
      )
    end

    def address_params
      params.require(:intake_address).permit(:phone, :floor, :comment, :terms_of_service)
    end
  end
end
