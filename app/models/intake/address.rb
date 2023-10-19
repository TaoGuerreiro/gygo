# frozen_string_literal: true

module Intake
  class Address
    include ActiveModel::Model
    attr_accessor :phone, :floor, :comment

    validates :phone, presence: true
    validates :floor, presence: true
    validates :comment, presence: true
  end
end
