class Post < ApplicationRecord
 
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :comments,dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  
  has_attached_file :image, styles: { medium: "300x300>", large: "800x1200", thumb: "100x100>" }

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  
  validates :content, presence: true, length: {maximum: 250}
  validates :user_id, presence: true


  private

  # Validates the size of an uploaded picture.


end
