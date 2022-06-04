class User < ApplicationRecord
  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups
  
  has_many :active_friendship, class_name: "Friendship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_friendship, class_name: "Friendship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_friendship, source: :followed
  has_many :followers, through: :passive_friendship, source: :follower

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
