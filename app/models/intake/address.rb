# frozen_string_literal: true

module Intake
  class Address
    include ActiveModel::Model
    attr_accessor :phone, :floor, :comment, :terms_of_service


    validates :phone, presence: true
    validates :floor, presence: true
    validates :comment, presence: true
    validates :terms_of_service, presence: true, acceptance: true
  end
end
