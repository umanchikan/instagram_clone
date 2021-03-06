class User < ApplicationRecord
  has_many :pictures
  has_many :favorites, dependent: :destroy
  validates :name,  presence: true, length: { maximum: 60 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  mount_uploader :user_picture, ImageUploader
end
