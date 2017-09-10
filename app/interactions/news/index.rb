class News::Index < BaseInteraction
  array :tags, default: nil
  string :page, default: nil

  def execute
    news = if tags.present?
      News.joins(:tags).where(tags: { name: tags }).group('news.id')
    else
      News.all.includes(:tags)
    end
    news.order(:id).page(page).per(12)
  end

end
