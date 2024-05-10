class SceneCollection < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :scenes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :video_id,
    presence: true
  validates :video_title,
    presence: true
  validates :channel_name,
    presence: true
  validates :short_description,
    presence: true,
    length: { maximum: 400 }

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "channel_name", "created_at", "short_description", "updated_at", "user_id", "video_title"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "user"]
  end
end
