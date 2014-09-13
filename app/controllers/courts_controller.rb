class CourtsController < ApplicationController
  before_action :set_court, only: [:show, :edit, :update, :destroy]

  # GET /courts
  # GET /courts.json
  def index
    binding.pry
    @courts = Court.page(params[:page])
  end

  # GET /courts/1
  # GET /courts/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_court
      @court = Court.find(params[:id])
      @proceedings = @court.proceedings.page(params[:court_proceedings_page])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def court_params
      params[:court]
    end
end
