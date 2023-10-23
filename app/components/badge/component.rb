# frozen_string_literal: true

module Badge
  class Component < ViewComponent::Base
    def initialize(color: "green")
      super
      @color = color
    end

    attr_reader :color
  end
end
