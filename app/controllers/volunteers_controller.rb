class VolunteersController < ApplicationController

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.create(volunteer_params)
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:email, :name, :last_name)
  end
end
