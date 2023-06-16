class User < ApplicationRecord
  has_many :likes
  has_many :liked_recipes, through: :likes, source: :recipe
  has_many :recipes
  has_secure_password
  # Rest of your User model code
end