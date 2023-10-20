# == Schema Information
#
# Table name: authorizations
#
#  id                  :bigint           not null, primary key
#  access_token        :string
#  access_token_secret :string
#  email               :string
#  expires             :boolean
#  expires_at          :date
#  provider            :string
#  refresh_token       :string
#  uid                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :bigint           not null
#
# Indexes
#
#  index_authorizations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Authorization < ApplicationRecord
  belongs_to :user
  validates :uid, uniqueness: { scope: :provider }
end
