module Admin
  class TrainingsController < Admin::ApplicationController

    private

    def permitted_attributes
      super + [{ user_ids: [], images: [] }]
    end
  end
end
