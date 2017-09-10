require "administrate/base_dashboard"

class AedDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    aed_model: Field::BelongsTo,
    area: Field::String,
    city: Field::String,
    district: Field::String,
    address: Field::String,
    location_type: DropdownWithTagsField,
    phone: Field::String,
    email: Field::String,
    owner: Field::String,
    description: Field::Text,
    availability: Field::String,
    approved: EnumField.with_options(collection: Aed.approveds.keys),
    lonlat: Field::String,
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
    :city,
    :address,
    :location_type,
    :approved
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :aed_model,
    :area,
    :city,
    :district,
    :address,
    :location_type,
    :phone,
    :email,
    :owner,
    :description,
    :availability,
    :lonlat,
    :approved,
    :images,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :aed_model,
    :area,
    :city,
    :district,
    :address,
    :location_type,
    :phone,
    :email,
    :owner,
    :description,
    :availability,
    :lonlat,
    :approved,
    :images,
  ].freeze

  # Overwrite this method to customize how news are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(aed)
    "##{aed.id}: #{aed.name}"
  end
end
