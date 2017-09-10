class AedsController < ApplicationController
  before_action :format_lonlat_param, only: :create

  def index
    @aeds = Aed.includes(:aed_model).order(approved: :desc)
    @aed_models = AedModel.all.pluck(:name, :id)
    @location_types = @aeds.pluck(:location_type).uniq
    @aed = Aed.new if user_signed_in?
  end

  def create
    @aed = Aed.create(aed_params)
    if @aed.valid?
      redirect_to aeds_path
    else
      render :index
    end
  end

  private

  def aed_params
    params.required(:aed).permit(:name, :area, :city, :district, :address, :phone, :email, :description,
      :lonlat, :location_type, :aed_model_id, { images: [] })
  end

  def format_lonlat_param
    return unless params[:aed][:lonlat]
    params[:aed][:lonlat] = "POINT (#{params[:aed][:lonlat].split(/ |,/).first} #{params[:aed][:lonlat].split(/ |,/).last})"
  end
end
