class Recipe < ApplicationRecord
  has_one_attached :image
  has_many :likes
  has_many :liked_by_users, through: :likes, source: :user
end

