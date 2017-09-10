require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

s.every '1d' do

  Training.deadline([1,7,14]).each do |training|
    training.participants.each do |user|
      NotificationMailer.training_reminder(user, training).deliver_now
    end
  end

  Rails.logger.info "LOGGER >> SCHEDULER >> "
end
