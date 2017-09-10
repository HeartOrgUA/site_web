class NewsSubscribe < ActiveRecord::Base

  before_save :format_email
  after_create :notify_user

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  private

  def format_email
    email.downcase!
  end

  def notify_user
    NotificationMailer.news_subscribed(email).deliver_now
  end
end
