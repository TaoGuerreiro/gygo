# frozen_string_literal: true
module Header
  class Component < ViewComponent::Base
    def initialize(title:, backpath:)
      @title = title
      @backpath = backpath || "root_path"
    end

    attr_reader :backpath
  end
end
