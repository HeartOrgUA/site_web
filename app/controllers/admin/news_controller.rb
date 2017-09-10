module Admin
  class NewsController < Admin::ApplicationController

    private

    def permitted_attributes
      super + [{ images: [] }]
    end
  end
end
