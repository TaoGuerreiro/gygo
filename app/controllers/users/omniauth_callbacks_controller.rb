# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    # You should configure your model like this:
    # devise :omniauthable, omniauth_providers: [:twitter]

    # You should also create an action method in this controller like this:
    def facebook
      handle_omniauth_callback("Facebook")
    end

    def google_oauth2
      handle_omniauth_callback("Google")
    end

    def twitter
      handle_omniauth_callback("Twitter")
    end

    # More info at:
    # https://github.com/heartcombo/devise#omniauth

    # GET|POST /resource/auth/twitter
    # def passthru
    #   super
    # end

    # GET|POST /users/auth/twitter/callback
    # def failure
    #   super
    # end

    # protected

    # The path used when OmniAuth fails
    # def after_omniauth_failure_path_for(scope)
    #   super(scope)
    # end

    protected

    def after_omniauth_failure_path_for(_scope)
      new_user_session_path
    end

    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || root_path
    end

    private

    def handle_omniauth_callback(provider)
      user = User.from_omniauth(auth)

      if user.present?
        sign_out_all_scopes
        flash[:success] = "C'est tout bon!"
        # flash[:success] = t("devise.omniauth_callbacks.success", kind: provider)
        sign_in_and_redirect user, event: :authentication
      else
        flash[:alert] = "Oups, petit soucis!"
        # flash[:alert] = t("devise.omniauth_callbacks.failure", kind: provider, reason: "#{auth.info.email} is not authorized.")
        redirect_to new_user_session_path
      end
    end

    def auth
      @auth ||= request.env["omniauth.auth"]
    end
  end
end
