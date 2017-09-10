class News < ActiveRecord::Base
  mount_uploaders :images, NewsImageUploader

  belongs_to :user
  has_many :news_tags
  has_many :tags, through: :news_tags

  default_scope -> { order(:publication_date) }

  def avatar_url
    images.first&.url || 'space.jpg'
  end
end
