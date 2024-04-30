class Category < ApplicationRecord
  has_many :scene_collections

  validates :category_name, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["id"]
  end
end
