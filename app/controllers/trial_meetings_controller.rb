class TrialMeetingsController < ApplicationController
  before_action :set_trial_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @trial_meetings = TrialMeeting.page(params[:page])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trial_meeting
      @trial_meeting = TrialMeeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trial_meeting_params
      params[:trial_meeting]
    end
end
