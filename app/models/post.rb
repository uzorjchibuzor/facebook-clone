class Post < ApplicationRecord
 
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :comments
  has_many :likes, as: :likeable
  mount_uploader :picture, PictureUploader
  
  validates :content, presence: true, length: {maximum: 250}
  validates :user_id, presence: true
  validate  :picture_size

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 1.megabytes
      errors.add(:picture, "should be less than 1MB")
    end
  end

end
