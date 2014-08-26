class TrialMeetingsController < ApplicationController
  before_action :set_trial_meeting, only: [:show, :edit, :update, :destroy]

  # GET /trial_meetings
  # GET /trial_meetings.json
  def index
    @trial_meetings = TrialMeeting.all
  end

  # GET /trial_meetings/1
  # GET /trial_meetings/1.json
  def show
  end

  # GET /trial_meetings/new
  def new
    @trial_meeting = TrialMeeting.new
  end

  # GET /trial_meetings/1/edit
  def edit
  end

  # POST /trial_meetings
  # POST /trial_meetings.json
  def create
    @trial_meeting = TrialMeeting.new(trial_meeting_params)

    respond_to do |format|
      if @trial_meeting.save
        format.html { redirect_to @trial_meeting, notice: 'Trial meeting was successfully created.' }
        format.json { render :show, status: :created, location: @trial_meeting }
      else
        format.html { render :new }
        format.json { render json: @trial_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trial_meetings/1
  # PATCH/PUT /trial_meetings/1.json
  def update
    respond_to do |format|
      if @trial_meeting.update(trial_meeting_params)
        format.html { redirect_to @trial_meeting, notice: 'Trial meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @trial_meeting }
      else
        format.html { render :edit }
        format.json { render json: @trial_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trial_meetings/1
  # DELETE /trial_meetings/1.json
  def destroy
    @trial_meeting.destroy
    respond_to do |format|
      format.html { redirect_to trial_meetings_url, notice: 'Trial meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
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
