class NotificationMailer < ApplicationMailer
  sendgrid_category :use_subject_lines

  def be_a_volunteer(email)
    @email = email
    sendgrid_category "Volunteer request"
    mail subject: "Запрос на волонтерство", to: @email
  end

  def news_subscribed(email)
    @email = email
    sendgrid_category "News subscription"
    mail subject: "Подписка на новости", to: @email
  end

  def training_reminder(user, training)
    @user = user
    @training = training
    sendgrid_category "Training reminder"
    mail subject: "У Вас скоро тренинг", to: @user.email
  end
end
