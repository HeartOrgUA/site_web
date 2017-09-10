module Admin
  class AedsController < Admin::ApplicationController

    private

    def permitted_attributes
      super + [{ images: [] }]
    end
  end
end
