class Interest < ApplicationRecord
  has_and_belongs_to_many :users, dependent: :delete_all

  validates :interest,
    presence: true,
    uniqueness: true
end
