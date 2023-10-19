class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :twitter, :facebook]

  has_many :authorizations, dependent: :destroy

  # Validation
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.from_omniauth(auth)
    # find an existing user or create a user and authorizations
    # schema of auth https://github.com/omniauth/omniauth/wiki/Auth-Hash-Schema

    # returning user
    authorization = Authorization.find_by(provider: auth.provider, uid: auth.uid)

    return authorization.user if authorization

    # match existing user
    existing_user = find_for_database_authentication(email: auth["info"]["email"])
    if existing_user
      existing_user.add_oauth_authorization(auth).save
      return existing_user
    end

    # if no user, a new one is created
    create_new_user_from_oauth(auth)
  end

  def add_oauth_authorization(data)
    authorizations.build(
      {
        provider: data["provider"],
        uid: data["uid"],
        access_token: data["credentials"]["token"],
        access_token_secret: data["credentials"]["secret"],
        refresh_token: data["credentials"]["refresh_token"],
        expires: data["credentials"]["expires"],
        expires_at: (date_formating data["credentials"]["expires_at"]),
        email: data["info"]["email"]
      }
    )
  end

  def date_formating(time)
    return nil if time.nil?

    Time.zone.at(time)
  end

  def self.create_new_user_from_oauth(auth)
    user = User.new(
      email: auth.info.email,
      password: Devise.friendly_token[0, 20],
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      avatar_url: auth.info.image
    )
    user.add_oauth_authorization(auth).save
    user
  end
end
