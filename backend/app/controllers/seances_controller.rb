class SeancesController < ApplicationController

  def index
    @seances = @current_user.seances
    render json: @seances, status: :ok
  end

  def show
    render json: @current_user.seances, status: :ok
  end

  def create
     @seance = @current_user.seances.new(seance_params)
     if @seance.save!
        render json: @seance, status: :ok
    else
        render json: { errors: @seance.errors.full_message }, status: :unprocessable_entity
    end
  end

  private

  def seance_params
    params.permit(:name, exercice: [])
  end

end
