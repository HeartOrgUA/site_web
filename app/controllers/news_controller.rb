class NewsController < ApplicationController
  before_action :find_news, only: :show

  def show
  end

  def index
    outputs = News::Index.run(tags: params[:tags], page: params[:page])
    @news = outputs.result
    @tags = Tag.all
  end

  private

  def find_news
    @news = News.includes(:tags).find(params[:id])
  end
end
