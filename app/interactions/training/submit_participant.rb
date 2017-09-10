class Training::SubmitParticipant < BaseInteraction
  object :user
  object :training

  validates :user, :training, presence: true

  def execute
    if user.persisted?
      training.participants << user
    else
      errors.add(:training, I18n.t('user_is_invalid'))
    end
    training
  rescue ActiveRecord::RecordInvalid
    errors.add(:training, I18n.t('user_already_assigned_to_event'))
    training
  end

end
