class Project < ActiveRecord::Base
  mount_uploader :image, ProjectUploader

  enum status: { in_progress: 0, active: 1 }
end
