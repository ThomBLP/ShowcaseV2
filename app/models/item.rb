class Item < ApplicationRecord
  belongs_to :category
  has_many_attached :photos

  validates :name, :description, :photos, :category_id, presence: true
end
