# frozen_string_literal: true

module Intake
  class Location
    include ActiveModel::Model
    attr_accessor :address

    validates :address, presence: true
  end
end
