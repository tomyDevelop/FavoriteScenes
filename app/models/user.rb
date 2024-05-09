class User < ApplicationRecord
  authenticates_with_sorcery!

  has_one :profile, dependent: :destroy
  has_and_belongs_to_many :interests, dependent: :delete_all
  has_many :scene_collections, dependent: :destroy
  has_many :comments, dependent: :destroy

  VALID_ACOUNT_NAME_REGEX = /\A[a-zA-Z0-9_]{1,}\z/
  VALID_PASSWORD_REGEX = /\A[a-zA-Z0-9@!&-]{4,}\z/

  validates :account_name,
    presence: true,
    uniqueness: true, on: :create,
    format: { with: VALID_ACOUNT_NAME_REGEX }, on: :create
  validates :password,
    presence: true,
    confirmation: true,
    length: { in: 4..40 },
    format: { with: VALID_PASSWORD_REGEX }, on: :create
  validates :password_confirmation,
    presence: true, on: :create

  def self.ransackable_attributes(auth_object = nil)
    ["id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["profile"]
  end
end
