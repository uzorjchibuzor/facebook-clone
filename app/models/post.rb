class Post < ApplicationRecord
 
  belongs_to :user
  has_many :comments
  has_many :likes, as: :likeable
  
  validates :content, presence: true, length: {maximum: 250}
  validates :user_id, presence: true


end
