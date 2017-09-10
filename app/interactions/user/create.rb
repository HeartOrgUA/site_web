class User::Create < BaseInteraction
  string :first_name, default: nil
  string :last_name, default: nil
  string :email
  string :phone, default: nil

  validates :email, presence: true

  def execute
    password = SecureRandom.hex(5)
    user = ::User.new(inputs.merge(password: password))
    unless user.save
      errors.merge!(user.errors)
    end

    user
  end

end
