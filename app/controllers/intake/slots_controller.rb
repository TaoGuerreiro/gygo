# frozen_string_literal: true

module Intake
  class SlotsController < ApplicationController
    def new
      @slot = Intake::Slot.new
    end

    def create
      @slot = Intake::Slot.new(slot_params)

      if @slot.valid?
        slot_attributes

        redirect_to new_user_registration_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    private

    def slot_attributes
      session[:registration][:slot_attributes] = {
        day: @slot.day_name,
        start_hour: @slot.day_slot.split("-").first,
        end_hour: @slot.day_slot.split("-").last
      }
    end

    def slot_params
      params.require(:intake_slot).permit(:day_name, :day_slot)
    end
  end
end
