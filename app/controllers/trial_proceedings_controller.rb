class TrialProceedingsController < ApplicationController
  before_action :set_trial_proceeding, only: [:show, :edit, :update, :destroy]

  # GET /trial_proceedings
  # GET /trial_proceedings.json
  def index
    @trial_proceedings = TrialProceeding.all
  end

  # GET /trial_proceedings/1
  # GET /trial_proceedings/1.json
  def show
  end

  # GET /trial_proceedings/new
  def new
    @trial_proceeding = TrialProceeding.new
  end

  # GET /trial_proceedings/1/edit
  def edit
  end

  # POST /trial_proceedings
  # POST /trial_proceedings.json
  def create
    @trial_proceeding = TrialProceeding.new(trial_proceeding_params)

    respond_to do |format|
      if @trial_proceeding.save
        format.html { redirect_to @trial_proceeding, notice: 'Trial proceeding was successfully created.' }
        format.json { render :show, status: :created, location: @trial_proceeding }
      else
        format.html { render :new }
        format.json { render json: @trial_proceeding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trial_proceedings/1
  # PATCH/PUT /trial_proceedings/1.json
  def update
    respond_to do |format|
      if @trial_proceeding.update(trial_proceeding_params)
        format.html { redirect_to @trial_proceeding, notice: 'Trial proceeding was successfully updated.' }
        format.json { render :show, status: :ok, location: @trial_proceeding }
      else
        format.html { render :edit }
        format.json { render json: @trial_proceeding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trial_proceedings/1
  # DELETE /trial_proceedings/1.json
  def destroy
    @trial_proceeding.destroy
    respond_to do |format|
      format.html { redirect_to trial_proceedings_url, notice: 'Trial proceeding was successfully destroyed.' }
      format.json { head :no_content }
    end
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
