module DefaultOrder
  def settings_order
    attribute = Setting.order_by.find_by(affected_model: model_name.name.downcase).value
    direction = Setting.order_direction.find_by(affected_model: model_name.name.downcase).value
    return if attribute.nil? || direction.nil?

    order("#{attribute} #{direction}")
  end
end
