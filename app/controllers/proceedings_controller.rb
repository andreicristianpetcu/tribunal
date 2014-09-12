class ProceedingsController < ApplicationController
  before_action :set_proceeding, only: [:show, :edit, :update, :destroy]

  # GET /proceedings
  # GET /proceedings.json
  def index
    @proceedings = Proceeding.all
  end

  # GET /proceedings/1
  # GET /proceedings/1.json
  def show
  end

  # GET /proceedings/new
  def new
    @proceeding = Proceeding.new
  end

  # GET /proceedings/1/edit
  def edit
  end

  # POST /proceedings
  # POST /proceedings.json
  def create
    @proceeding = Proceeding.new(proceeding_params)

    respond_to do |format|
      if @proceeding.save
        format.html { redirect_to @proceeding, notice: 'Proceeding was successfully created.' }
        format.json { render :show, status: :created, location: @proceeding }
      else
        format.html { render :new }
        format.json { render json: @proceeding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proceedings/1
  # PATCH/PUT /proceedings/1.json
  def update
    respond_to do |format|
      if @proceeding.update(proceeding_params)
        format.html { redirect_to @proceeding, notice: 'Proceeding was successfully updated.' }
        format.json { render :show, status: :ok, location: @proceeding }
      else
        format.html { render :edit }
        format.json { render json: @proceeding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proceedings/1
  # DELETE /proceedings/1.json
  def destroy
    @proceeding.destroy
    respond_to do |format|
      format.html { redirect_to proceedings_url, notice: 'Proceeding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proceeding
      @proceeding = Proceeding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proceeding_params
      params[:proceeding]
    end
end
