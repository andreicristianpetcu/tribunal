class TrialFilesController < ApplicationController
  before_action :set_trial_file, only: [:show, :edit, :update, :destroy]

  # GET /trial_files
  # GET /trial_files.json
  def index
    @trial_files = TrialFile.all
  end

  # GET /trial_files/1
  # GET /trial_files/1.json
  def show
  end

  # GET /trial_files/new
  def new
    @trial_file = TrialFile.new
  end

  # GET /trial_files/1/edit
  def edit
  end

  # POST /trial_files
  # POST /trial_files.json
  def create
    @trial_file = TrialFile.new(trial_file_params)

    respond_to do |format|
      if @trial_file.save
        format.html { redirect_to @trial_file, notice: 'Trial file was successfully created.' }
        format.json { render :show, status: :created, location: @trial_file }
      else
        format.html { render :new }
        format.json { render json: @trial_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trial_files/1
  # PATCH/PUT /trial_files/1.json
  def update
    respond_to do |format|
      if @trial_file.update(trial_file_params)
        format.html { redirect_to @trial_file, notice: 'Trial file was successfully updated.' }
        format.json { render :show, status: :ok, location: @trial_file }
      else
        format.html { render :edit }
        format.json { render json: @trial_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trial_files/1
  # DELETE /trial_files/1.json
  def destroy
    @trial_file.destroy
    respond_to do |format|
      format.html { redirect_to trial_files_url, notice: 'Trial file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trial_file
      @trial_file = TrialFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trial_file_params
      params[:trial_file]
    end
end
