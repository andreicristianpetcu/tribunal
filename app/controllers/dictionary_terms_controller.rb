class DictionaryTermsController < ApplicationController
  before_action :set_dictionary_term, only: [:show, :edit, :update, :destroy]

  # GET /dictionary_terms
  # GET /dictionary_terms.json
  def index
    @dictionary_terms = DictionaryTerm.all
  end

  # GET /dictionary_terms/1
  # GET /dictionary_terms/1.json
  def show
  end

  # GET /dictionary_terms/new
  def new
    @dictionary_term = DictionaryTerm.new
  end

  # GET /dictionary_terms/1/edit
  def edit
  end

  # POST /dictionary_terms
  # POST /dictionary_terms.json
  def create
    @dictionary_term = DictionaryTerm.new(dictionary_term_params)

    respond_to do |format|
      if @dictionary_term.save
        format.html { redirect_to @dictionary_term, notice: 'Dictionary term was successfully created.' }
        format.json { render :show, status: :created, location: @dictionary_term }
      else
        format.html { render :new }
        format.json { render json: @dictionary_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dictionary_terms/1
  # PATCH/PUT /dictionary_terms/1.json
  def update
    respond_to do |format|
      if @dictionary_term.update(dictionary_term_params)
        format.html { redirect_to @dictionary_term, notice: 'Dictionary term was successfully updated.' }
        format.json { render :show, status: :ok, location: @dictionary_term }
      else
        format.html { render :edit }
        format.json { render json: @dictionary_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dictionary_terms/1
  # DELETE /dictionary_terms/1.json
  def destroy
    @dictionary_term.destroy
    respond_to do |format|
      format.html { redirect_to dictionary_terms_url, notice: 'Dictionary term was successfully destroyed.' }
      format.json { head :no_content }
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
