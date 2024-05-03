class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :scene_collection

  validates :body,
    presence: true
end
