class SceneCollection < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :video_id,
    presence: true
  validates :title,
    presence: true,
    length: { maximum: 100 }
  validates :short_description,
    length: { maximum: 400 }
end
