require "administrate/field/base"

class EnumField < Administrate::Field::Base

  def selectable_options
    collection
  end

  def to_s
    data
  end

  private

  def collection
    @collection ||= options.fetch(:collection, [])
  end
end
