require "administrate/field/base"

class ImagesField < Administrate::Field::Base
  def to_s
    data
  end
end
