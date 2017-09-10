class UserGroup < ActiveRecord::Base
  has_many :users

  enum role: { regular: 0, staff: 1, expert: 2 }
end
