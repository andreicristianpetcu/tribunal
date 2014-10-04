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
