class Category < ApplicationRecord
  has_many :scene_collections

  validates :category_name, presence: true, uniqueness: true
end
