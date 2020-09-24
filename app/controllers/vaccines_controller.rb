class VaccinesController < ApplicationController
  def index
    if current_user.clinic_owner
      @vaccines = Vaccine.where(clinic: current_user.clinic)
    else
      redirect_to root_path
    end
  end

  def new
    @vaccine = Vaccine.new
  end

  def create
    @vaccine = Vaccine.new(vaccine_params)
    @vaccine.clinic = current_user.clinic
    if @vaccine.save
      redirect_to vaccines_path, notice: 'Vacina criada com sucesso.'
    else
      render :new
    end
  end

  def destroy
    @vaccine = Vaccine.find(params[:id])
    # Caso não use o pundit
    if @vaccine.clinic != current_user.clinic
      redirect_to root_path, alert: 'Não autorizado.'
      return
    end

    @vaccine.destroy
    redirect_to vaccines_path, notice: 'Vacina excluida com sucesso.'
  end

  private

  def vaccine_params
    params.require(:vaccine).permit(:price, :vaccine_type_id)
  end
end
