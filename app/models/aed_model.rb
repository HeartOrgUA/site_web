class AedModel < ActiveRecord::Base
  has_many :aeds

  before_save :clear_blank_characteristics

  private

  def clear_blank_characteristics
    characteristics.reject!(&:blank?)
  end
end
