class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images

  scope :search_by_keyword, ->(keyword, search_type = "partial") {
    return if keyword.blank?

    if search_type == "exact"
      where("title = ? OR location_name = ? OR body = ?", keyword, keyword, keyword)
    else
      where("title LIKE ? OR location_name LIKE ? OR body LIKE ?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
    end
  }

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  def favorited_by?(user)
    favorites.exists?(user_id: user&.id)
  end

  validates :title, presence: true
  validates :body, presence: true
end
