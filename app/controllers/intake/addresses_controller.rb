module Intake
  class AddressesController < ApplicationController
    def new
      @address = Intake::Address.new
    end

    def create
      @address = Intake::Address.new(address_params)

      if @address.valid?
        session[:registration][:phone] = @address.phone
        session[:registration][:floor] = @address.floor
        session[:registration][:comment] = @address.comment

        redirect_to new_intake_slot_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def address_params
      params.require(:intake_address).permit(:phone, :floor, :comment)
    end
  end
end
