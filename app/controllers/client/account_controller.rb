# frozen_string_literal: true

module Client
  class AccountController < ApplicationController
    before_action :authenticate_user!

    def show
      @user = User.includes(address: :slot).find(current_user.id)
      @address = @user.address
    end
  end
end
