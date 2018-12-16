class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :micropost, optional: true
  has_many :comments
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, length: { maximum: 140 }
  validate  :picture_size

  def micropost_type
    if micropost_id? && content?
      "quote-post"
    elsif micropost_id?
      "repost"
    else
      "micropost"
    end
  end

  private

  # Validates the size of an uploaded picture.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end