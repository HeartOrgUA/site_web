class NewsTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :news
end
