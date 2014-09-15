class JurisprudencesController < ApplicationController
  before_action :set_jurisprudence, only: [:show, :edit, :update, :destroy]

  # GET /jurisprudences
  # GET /jurisprudences.json
  def index
    @jurisprudences = Jurisprudence.page(params[:jurisprudence_page])
  end

  # GET /jurisprudences/1
  # GET /jurisprudences/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jurisprudence
      @jurisprudence = Jurisprudence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jurisprudence_params
      params[:jurisprudence]
    end
end
