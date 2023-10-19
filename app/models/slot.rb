class Slot < ApplicationRecord
  extend Enumerize

  belongs_to :address

  DAYS = %w[monday tuesday wednesday thursday friday saturday].freeze
  enumerize :day, in: DAYS, predicates: true
  OPENING_HOUR = "08:00"
  CLOSING_HOUR = "18:00"
  SLOT_SIZE = 2.hours


  def self.slot_array
    start_time = Time.parse(OPENING_HOUR)
    end_time = Time.parse(CLOSING_HOUR)

    slots = []

    while start_time < end_time
      end_slot = start_time + SLOT_SIZE
      slots << "#{start_time.strftime("%H:%M")}-#{end_slot.strftime("%H:%M")}"
      start_time = end_slot
    end

    slots
  end
end
