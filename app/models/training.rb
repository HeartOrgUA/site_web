class Training < ActiveRecord::Base
  mount_uploaders :images, TrainingUploader

  enum prerequisite: { medical_high_school_not_needed: 0, medical_high_school_needed: 1 }
  enum status: { in_progress: 0, active: 1 }

  has_many :trainings_users
  has_many :users, through: :trainings_users
  has_many :participant_trainings
  has_many :participants, through: :participant_trainings, source: 'user'

  scope :deadline, ->(days) {
    where("date_part('day', start_date - now()) IN (#{days.join(',')})")
  }
end
