# frozen_string_literal: true

module Intake
  class Slot
    include ActiveModel::Model
    attr_accessor :day_slot, :day_name

    validates :day_slot, presence: true
    validates :day_name, presence: true
  end
end
