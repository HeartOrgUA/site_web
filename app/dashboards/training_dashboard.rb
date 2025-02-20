require "administrate/base_dashboard"

class TrainingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    duration: Field::Number,
    prerequisite: EnumField.with_options(collection: Training.prerequisites.keys),
    users: Field::HasMany,
    start_date: Field::DateTime,
    status: EnumField.with_options(collection: Training.statuses.keys),
    description: Field::Text,
    images: ImagesField,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :duration,
    :status,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :duration,
    :prerequisite,
    :start_date,
    :users,
    :status,
    :description,
    :images,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :duration,
    :prerequisite,
    :start_date,
    :users,
    :status,
    :description,
    :images,
  ].freeze

  # Overwrite this method to customize how volunteers are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(training)
    training.name
  end
end
