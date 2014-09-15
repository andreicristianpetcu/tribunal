class DictionaryTermsController < ApplicationController
  before_action :set_dictionary_term, only: [:show, :edit, :update, :destroy]

  # GET /dictionary_terms
  # GET /dictionary_terms.json
  def index
    @dictionary_terms = DictionaryTerm.all
    @letters = Hash.new
    @dictionary_terms.each do |term|
      letter = term.termen[0].upcase
      if @letters[letter].nil?
        @letters[letter] = term.id
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dictionary_term
      @dictionary_term = DictionaryTerm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dictionary_term_params
      params[:dictionary_term]
    end
end
