class User < ActiveRecord::Base
  mount_uploaders :images, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :user_group
  has_many :trainings_users
  has_many :trainings, through: :trainings_users
  has_many :participant_trainings
  has_many :courses, through: :participant_trainings, source: 'training'
  has_many :news

  scope :staff, -> { joins(:user_group).where(user_groups: { role: UserGroup.roles[:staff] }) }
  scope :expert, -> { joins(:user_group).where(user_groups: { role: UserGroup.roles[:expert] }) }

  def avatar_url
    images.first&.url || 'default_avatar.jpg'
  end

  def position
    user_group.name
  end
end
