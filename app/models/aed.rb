class Aed < ActiveRecord::Base
  enum approved: { waiting: 0, active: 1 }

  mount_uploaders :images, AedImageUploader

  belongs_to :aed_model

  def lat
    lonlat&.x || 0
  end

  def lng
    lonlat&.y || 0
  end

  def as_json(options)
    super.merge lat: lat, lng: lng
  end

  def model
    aed_model.name
  end

  def avatar
    images.first&.url || '7.png'
  end
end
