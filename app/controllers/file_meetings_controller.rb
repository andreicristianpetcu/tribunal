class FileMeetingsController < ApplicationController
  before_action :set_file_meeting, only: [:show, :edit, :update, :destroy]

  # GET /file_meetings
  # GET /file_meetings.json
  def index
    @file_meetings = FileMeeting.all
  end

  # GET /file_meetings/1
  # GET /file_meetings/1.json
  def show
  end

  # GET /file_meetings/new
  def new
    @file_meeting = FileMeeting.new
  end

  # GET /file_meetings/1/edit
  def edit
  end

  # POST /file_meetings
  # POST /file_meetings.json
  def create
    @file_meeting = FileMeeting.new(file_meeting_params)

    respond_to do |format|
      if @file_meeting.save
        format.html { redirect_to @file_meeting, notice: 'File meeting was successfully created.' }
        format.json { render :show, status: :created, location: @file_meeting }
      else
        format.html { render :new }
        format.json { render json: @file_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_meetings/1
  # PATCH/PUT /file_meetings/1.json
  def update
    respond_to do |format|
      if @file_meeting.update(file_meeting_params)
        format.html { redirect_to @file_meeting, notice: 'File meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_meeting }
      else
        format.html { render :edit }
        format.json { render json: @file_meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_meetings/1
  # DELETE /file_meetings/1.json
  def destroy
    @file_meeting.destroy
    respond_to do |format|
      format.html { redirect_to file_meetings_url, notice: 'File meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_meeting
      @file_meeting = FileMeeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_meeting_params
      params.require(:file_meeting).permit(:number, :old_number, :date, :hour, :case_type, :trial_status)
    end
end
