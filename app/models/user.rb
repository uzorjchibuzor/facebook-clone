# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friendships
  has_many :friends, through: :friendships

  has_attached_file :avatar

  validates_attachment_content_type :avatar, content_type: ['image/jpg', 'image/jpeg', 'image/png']

  def full_name
    "#{first_name} #{last_name}"
  end

  def friend_with?(user)
    if friendships.find_by(friend_id: user.id)

      friendships.find_by(friend_id: user.id).status == 'active'
    elsif user.friendships.find_by(friend_id: id)
      user.friendships.find_by(friend_id: id).status == 'active'
    else
      false
    end
  end

  def pending_friendship_with?(user)
    true if friendships.find_by(friend_id: user.id) && (friendships.find_by(friend_id: user.id).status == 'pending')
  end
end
