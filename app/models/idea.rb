class Idea < ApplicationRecord
  validates :content, presence: true
  validates_length_of :content, minimum: 2, too_short: "%{count} characters is the minimum allowed"
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :usersWhoLiked, through: :likes, source: :user
end