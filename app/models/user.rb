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



  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def friend_with?(user)
    if self.friendships.find_by(friend_id:user.id)

     return self.friendships.find_by(friend_id:user.id).status == 'active'
    elsif user.friendships.find_by(friend_id:self.id) 
      return user.friendships.find_by(friend_id:self.id).status == 'active'
    else 
      return false
    end
  end

  def pending_friendship_with?(user)
    if self.friendships.find_by(friend_id:user.id)
   return true if self.friendships.find_by(friend_id:user.id).status == 'pending'
   end
  end

end
