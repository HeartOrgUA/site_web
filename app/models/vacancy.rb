class Vacancy < ActiveRecord::Base
  mount_uploader :image, VacancyUploader
end
