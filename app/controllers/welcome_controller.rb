class WelcomeController < ApplicationController
  def index
    @news = News.all.limit(3)
  end

  def about
    @users = User.extend(DefaultOrder).settings_order
  end

  def volonteer
    @vacancies = Vacancy.extend(DefaultOrder).settings_order
  end

  def contacts
  end

  def donate
  end

  def your_health
  end

  def subscribe
    @subscriber = NewsSubscribe.create(email: params[:email])
  end
end
