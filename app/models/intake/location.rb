# frozen_string_literal: true

module Intake
  class Location
    ADDRESS_PATTERN = /^([\p{L}\d\w\s'-]+),\s{1}(\d{5})\s{1}([\p{L}\d\w\s'-]+)(,\s{1}([\p{L}\d\w\s'-]+))?$/

    include ActiveModel::Model
    attr_accessor :address

    validates :address, presence: true

    def split_address
      if (match_data = address&.match(ADDRESS_PATTERN))
        {
          address: address,
          line_1: match_data[1],
          postal_code: match_data[2],
          city: match_data[3],
          country: match_data[5]
        }
      else
        { address: address }
      end
    end
  end
end
