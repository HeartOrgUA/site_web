module ApplicationHelper

  def active_link(link, classes = '')
    classes << ' active' if link.in? [request.path, request.original_url]
    classes
  end

  def custom_clearfix(index, per_row = 4)
    return '<div class="clearfix hidden-xs"></div>'.html_safe if index % per_row == 0
  end

  def project_link(name)
    return send(:"#{name.pluralize}_path")
  rescue NoMethodError
    '#'
  end

  def full_name_with_rank(user)
    return "#{user.first_name} #{user.middle_name} #{user.last_name}, #{user.grade_title}" if user.middle_name.present? && user.grade_title.present?
    return "#{user.first_name} #{user.middle_name} #{user.last_name}" if user.middle_name.present? && user.grade_title.blank?
    return "#{user.first_name} #{user.last_name}, #{user.grade_title}" if user.middle_name.blank? && user.grade_title.present?
    "#{user.first_name} #{user.last_name}"
  end

end
