# frozen_string_literal: true

module Subscriptions
  class CheckoutSessionsController < ApplicationController
    before_action :authenticate_user!

    def show
      # Comment: little bit dirty! but building the user address and slot here
      # This is to avoid having to futher mess with devise and omniauth controllers
      @address = current_user.create_address(session[:registration]) if current_user.address.nil?
    end
  end
end
