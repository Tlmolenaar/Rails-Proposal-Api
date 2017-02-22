class ProposalAppsController < ApplicationController
  before_action :set_proposal_app, only: [:show, :update, :destroy]

  # GET /proposal_apps
  def index
    @proposal_apps = ProposalApp.all

    render json: @proposal_apps
  end

  # GET /proposal_apps/1
  def show
    render json: @proposal_app
  end

  # POST /proposal_apps
  def create
    @proposal_app = ProposalApp.new(proposal_app_params)

    if @proposal_app.save
      render json: @proposal_app, status: :created, location: @proposal_app
    else
      render json: @proposal_app.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /proposal_apps/1
  def update
    if @proposal_app.update(proposal_app_params)
      render json: @proposal_app
    else
      render json: @proposal_app.errors, status: :unprocessable_entity
    end
  end

  # DELETE /proposal_apps/1
  def destroy
    @proposal_app.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proposal_app
      @proposal_app = ProposalApp.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def proposal_app_params
      params.require(:proposal_app).permit(:customer, :portfolio_url, :tools, :estimated_hours, :hourly_rate, :weeks_to_complete, :client_email)
    end
end
