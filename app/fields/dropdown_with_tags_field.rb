require "administrate/field/base"

class DropdownWithTagsField < Administrate::Field::Base

  def selectable_options
    collection
  end

  def to_s
    data
  end

  private

  def collection
    @collection ||= Aed.all.pluck(:location_type).uniq
  end
end
