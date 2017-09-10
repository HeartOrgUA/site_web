class TrainingsController < ApplicationController
  before_action :find_training, only: [:show, :submit_participant]

  def index
    @trainings = Training.includes(:users).extend(DefaultOrder).settings_order
  end

  def show
  end

  def submit_participant
    user_outputs = User::Create.run(user_params)
    @training_outputs = Training::SubmitParticipant.run(user: user_outputs.result, training: @training)
  end

  private

  def find_training
    @training = Training.find(params[:id])
  end

  def user_params
    params.required(:user).permit(:first_name, :last_name, :email, :phone)
  end
end
