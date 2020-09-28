class VaccineTypesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @vaccine_types = VaccineType.search_by_name_and_description(params[:query])
    else
      @vaccine_types = VaccineType.all
    end
  end
  def show
    @vaccine_type = VaccineType.find(params[:id])
    @vaccines = Vaccine.where(vaccine_type: @vaccine_type)
  end
end
