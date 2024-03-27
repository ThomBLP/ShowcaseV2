class Category < ApplicationRecord
  has_many :items, dependent: :destroy
  has_one_attached :photo
  validates :name, :description, :photo, presence: true
end
