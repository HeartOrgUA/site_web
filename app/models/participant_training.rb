class ParticipantTraining < ActiveRecord::Base
  belongs_to :user
  belongs_to :training

  validates :user_id, uniqueness: { scope: :training_id,
    message: I18n.t('user_already_assigned_to_event') }
end
