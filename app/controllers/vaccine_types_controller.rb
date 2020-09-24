class VaccineTypesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @vaccine_types = VaccineType.all
  end
  def show
    @vaccine_type = VaccineType.find(params[:id])
    @vaccines = Vaccine.where(vaccine_type: @vaccine_type)
  end
end
