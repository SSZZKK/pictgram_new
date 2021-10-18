class Article < ApplicationRecord
  validates :user_id, presence: true
  # validates :description, presence: true
  validates :title, :video, :presence => true

  belongs_to :user
    
  mount_uploader :video, VideoUploader
    
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  
  has_many :comments
  has_many :comment_users, through: :comments, source: 'user'
end
