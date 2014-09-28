class CourtsController < ApplicationController
  before_action :set_court, only: [:show, :edit, :update, :destroy]

  # GET /courts
  # GET /courts.json
  def index
    @courts = Court.all
  end

  # GET /courts/1
  # GET /courts/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_court
    if !params[:name].nil?
      @court = Court.where(name: params[:name]).first
    else
      @court = Court.find(params[:id])
    end
    @proceedings = @court.proceedings.page(params[:court_proceedings_page])
    @trial_meetings = @court.meetings.page(params[:court_meetings_page])
    @trial_judges = @court.judges.page(params[:court_judges_page])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def court_params
    params[:court]
  end
end
