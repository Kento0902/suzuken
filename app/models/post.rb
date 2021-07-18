class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :replies, dependent: :destroy
  mount_uploader :picture, PictureUploader
  has_many  :tag_relationships, dependent: :destroy
  has_many  :tags, through: :tag_relationships
  validates :picture, presence: true
  validates :title, presence: true
  validates :states, presence: true
  validates :comment, {length: {maximum: 230}}
  def save_tags(savepost_tags)
    savepost_tags.each do |new_name|
    post_tag = Tag.find_or_create_by(name: new_name)
    self.tags << post_tag
    end
  end
end
