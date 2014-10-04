class TrialCourtsController < ApplicationController
  before_action :set_trial_court, only: [:show, :edit, :update, :destroy]

  # GET /courts
  # GET /courts.json
  def index
    @trial_courts = TrialCourt.all
  end

  # GET /courts/1
  # GET /courts/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trial_court
      if !params[:name].nil?
        @trial_court = TrialCourt.where(name: params[:name]).first
      else
        @trial_court = TrialCourt.find(params[:id])
      end
      @proceedings = @trial_court.proceedings.page(params[:court_proceedings_page])
      @trial_meetings = @trial_court.meetings.page(params[:court_meetings_page])
      @trial_judges = @trial_court.judges.page(params[:court_judges_page])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def court_params
      params[:court]
    end
end
