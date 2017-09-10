class ProjectsController < ApplicationController
  def index
    @projects = Project.extend(DefaultOrder).settings_order
  end

  def show
  end
end
