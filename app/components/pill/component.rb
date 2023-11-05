# frozen_string_literal: true

module Pill
  class Component < ViewComponent::Base
    def initialize(color: "green")
      super
      @color = color
    end

    attr_reader :color
  end
end
