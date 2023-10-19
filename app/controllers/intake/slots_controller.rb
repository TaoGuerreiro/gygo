# frozen_string_literal: true

module Intake
  class SlotsController < ApplicationController
    def new
      @slot = Intake::Slot.new
    end

    def create
      @slot = Intake::Address.new(slot_params)

      if @slot.valid?
        session[:registration][:day_name] = @address.day_name
        session[:registration][:day_slot] = @address.day_slot

        redirect_to new_intake_slot_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def slot_params
      params.require(:intake_slot).permit(:day_name, :day_slot)
    end
  end
end
