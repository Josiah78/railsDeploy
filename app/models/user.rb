class User < ApplicationRecord
  before_save :email.downcase
  validates :name, :alias, :password, :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates_length_of :password, minimum: 8, too_short: "%{count} characters is the minimum allowed"
  validates_length_of :name, :alias, minimum: 3, too_short: "%{count} characters is the minimum allowed"
  has_many :ideas, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :ideasLiked, through: :likes, source: :idea
  has_secure_password
end