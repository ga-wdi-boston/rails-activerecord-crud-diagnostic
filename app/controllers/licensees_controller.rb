class LicenseesController < ApplicationController
  before_action :set_licensee, only: [:show, :update, :destroy]

  # GET /licensees
  # GET /licensees.json
  def index
    @licensees = Licensee.all

    render json: @licensees
  end

  # GET /licensees/1
  # GET /licensees/1.json
  def show
    render json: @licensee
  end

  # POST /licensees
  # POST /licensees.json
  def create
    @licensee = Licensee.new(licensee_params)

    if @licensee.save
      render json: @licensee, status: :created, location: @licensee
    else
      render json: @licensee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /licensees/1
  # PATCH/PUT /licensees/1.json
  def update
    @licensee = Licensee.find(params[:id])

    if @licensee.update(licensee_params)
      head :no_content
    else
      render json: @licensee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /licensees/1
  # DELETE /licensees/1.json
  def destroy
    @licensee.destroy

    head :no_content
  end

  private

    def set_licensee
      @licensee = Licensee.find(params[:id])
    end

    def licensee_params
       params.require(:licensee).permit(:surname,:given_name,:gender,:height,:weight,:born_on,:eye_color,:hair_color)
    end
end
