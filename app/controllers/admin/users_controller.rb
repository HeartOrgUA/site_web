module Admin
  class UsersController < Admin::ApplicationController

    private

    def permitted_attributes
      super + [{ images: [] }]
    end
  end
end
