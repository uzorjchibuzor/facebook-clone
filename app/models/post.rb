class Post < ApplicationRecord
 
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :comments,dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  
  
  validates :content, presence: true, length: {maximum: 250}
  validates :user_id, presence: true


  private

  # Validates the size of an uploaded picture.


end
