# frozen_string_literal: true

module Intake
  class LocationsController < ApplicationController
    def new
      @location = Intake::Location.new
    end

    def create
      @location = Intake::Location.new(location_params)
      if @location.valid?
        session[:location] = {
          'address' => @location.address
        }
        redirect_to new_intake_address_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def location_params
      params.require(:intake_location).permit(:address)
    end
  end
end
