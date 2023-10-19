# frozen_string_literal: true

module Intake
  class SlotsController < ApplicationController
    def new
      @slot = Intake::Slot.new
    end

    def create
      # TODO
    end

    private

    def slot_params
      params.require(:intake_slot).permit(:tba)
    end
  end
end
