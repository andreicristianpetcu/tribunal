class TrialProceedingsController < ApplicationController
  before_action :set_trial_proceeding, only: [:show, :edit, :update, :destroy]

  # GET /trial_proceedings
  # GET /trial_proceedings.json
  def index
    @trial_proceedings = TrialProceeding.page(params[:trial_proceedings_page])
  end

  # GET /trial_proceedings/1
  # GET /trial_proceedings/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trial_proceeding
      @trial_proceeding = TrialProceeding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trial_proceeding_params
      params[:trial_proceeding]
    end
end
