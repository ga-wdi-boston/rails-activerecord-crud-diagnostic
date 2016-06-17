class LicenceesController < ApplicationController
  before_action :set_licencee, only: [:show, :update, :destroy]

  # GET /licencees
  # GET /licencees.json
  def index
    @licencees = Licencee.all

    render json: @licencees
  end

  # GET /licencees/1
  # GET /licencees/1.json
  def show
    render json: @licencee
  end

  # POST /licencees
  # POST /licencees.json
  def create
    @licencee = Licencee.new(licencee_params)

    if @licencee.save
      render json: @licencee, status: :created, location: @licencee
    else
      render json: @licencee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /licencees/1
  # PATCH/PUT /licencees/1.json
  def update
    @licencee = Licencee.find(params[:id])

    if @licencee.update(licencee_params)
      head :no_content
    else
      render json: @licencee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /licencees/1
  # DELETE /licencees/1.json
  def destroy
    @licencee.destroy

    head :no_content
  end

  private

    def set_licencee
      @licencee = Licencee.find(params[:id])
    end

    def licencee_params
      params.require(:licencee).permit(:surname, :given_name, :gender, :height,
      :weight, :born_on, :eye_color, :hair_color)
    end
end
