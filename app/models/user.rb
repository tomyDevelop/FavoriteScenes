class User < ApplicationRecord
  authenticates_with_sorcery!

  has_one :profile, dependent: :destroy
  has_and_belongs_to_many :interests, dependent: :delete_all

  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9@!&-]{4,}\z/

  validates :account_name,
    presence: true,
    uniqueness: true, on: :create
  validates :password,
    presence: true,
    confirmation: true,
    length: { in: 4..40 },
    format: { with: VALID_PASSWORD_REGEX }, on: :create
  validates :password_confirmation,
    presence: true, on: :create

end
