require "administrate/field/base"

class ArrayField < Administrate::Field::Base
  def stored_array
    data
  end
end
