class Setting < ActiveRecord::Base
  AFFECTED_MODELS = %w(project vacancy training user)

  enum setting_type: { order_by: 0, order_direction: 1 }
end
