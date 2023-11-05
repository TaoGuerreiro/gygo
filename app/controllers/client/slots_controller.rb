# frozen_string_literal: true

module Client
  class SlotsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_slot, only: [:edit, :update]

    def edit; end

    def update
      if @slot.update(slot_params)
        flash[:notice] = 'Slot updated successfully'
        redirect_to account_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def find_slot
      @slot = current_user.slot
    end

    def slot_params
      start_hour, end_hour = params.require(:day_slot).split("-")

      params.require(:slot).permit(:day).merge(start_hour:, end_hour:)
    end
  end
end
