class Scene < ApplicationRecord
  belongs_to :scene_collection

  validates :seconds,
    presence: true
end
