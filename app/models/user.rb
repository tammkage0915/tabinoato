class User < ApplicationRecord
  has_secure_password
  has_one_attached :profile_image
  has_many :sessions, dependent: :destroy
  
  has_many :comments, dependent: :destroy

  has_many :posts, dependent: :destroy

  has_many :favorites, dependent: :destroy
  
  has_many :bookmark_posts, through: :favorites, source: :post

  validates :name, presence: true, uniqueness: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
