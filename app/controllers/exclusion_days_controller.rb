class ExclusionDaysController < ApplicationController
  before_action :set_exclusion_day, only: [:show, :edit, :update, :destroy]

  # GET /exclusion_days
  # GET /exclusion_days.json
  def index
    @exclusion_days = ExclusionDay.all
  end

  # GET /exclusion_days/1
  # GET /exclusion_days/1.json
  def show
  end

  # GET /exclusion_days/new
  def new
    @exclusion_day = ExclusionDay.new
  end

  # GET /exclusion_days/1/edit
  def edit
  end

  # POST /exclusion_days
  # POST /exclusion_days.json
  def create
    @exclusion_day = ExclusionDay.new(exclusion_day_params)

    respond_to do |format|
      if @exclusion_day.save
        format.html { redirect_to @exclusion_day, notice: 'Exclusion day was successfully created.' }
        format.json { render :show, status: :created, location: @exclusion_day }
      else
        format.html { render :new }
        format.json { render json: @exclusion_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exclusion_days/1
  # PATCH/PUT /exclusion_days/1.json
  def update
    respond_to do |format|
      if @exclusion_day.update(exclusion_day_params)
        format.html { redirect_to @exclusion_day, notice: 'Exclusion day was successfully updated.' }
        format.json { render :show, status: :ok, location: @exclusion_day }
      else
        format.html { render :edit }
        format.json { render json: @exclusion_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exclusion_days/1
  # DELETE /exclusion_days/1.json
  def destroy
    @exclusion_day.destroy
    respond_to do |format|
      format.html { redirect_to exclusion_days_url, notice: 'Exclusion day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exclusion_day
      @exclusion_day = ExclusionDay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exclusion_day_params
      params.require(:exclusion_day).permit(:day)
    end
end
