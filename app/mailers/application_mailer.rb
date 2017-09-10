class ApplicationMailer < ActionMailer::Base
  include SendGrid

  default from: "uha@volunteer.com"
  layout "mailer"
end
