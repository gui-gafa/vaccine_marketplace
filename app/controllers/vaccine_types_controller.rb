class VaccineTypesController < ApplicationController
  def index
    @vaccine_types = VaccineType.all
  end
  def show
    @vaccine_type = VaccineType.find(params[:id])
  end
end
