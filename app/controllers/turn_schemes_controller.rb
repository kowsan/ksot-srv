class TurnSchemesController < ApplicationController
  before_action :set_turn_scheme, only: [:show, :edit, :update, :destroy]
  before_action :check_permission, :validate_access

  # GET /turn_schemes
  # GET /turn_schemes.json
  def index
    @turn_schemes = TurnScheme.all
  end

  # GET /turn_schemes/1
  # GET /turn_schemes/1.json
  def show
  end

  # GET /turn_schemes/new
  def new
    @turn_scheme = TurnScheme.new
  end

  # GET /turn_schemes/1/edit
  def edit

  end

  # POST /turn_schemes
  # POST /turn_schemes.json
  def create
    s=false
    TurnScheme.transaction do
      @turn_scheme = TurnScheme.new(turn_scheme_params)
      s=@turn_scheme.save
      if s
        unless params[:day].nil?
          params[:day].each_with_index do |i, index|
            dates=i.split(',')

            dates.each do |d|
              dt=d.to_date
              ExclusionDay.find_or_create_by(day: dt, turn_type_id: params[:turn_type_id][index], turn_scheme_id: @turn_scheme.id)
            end
          end
        end

      end
    end
    respond_to do |format|
      if s
        format.html { redirect_to turn_schemes_path, notice: 'Схема смен была создана.' }
        format.json { render :show, status: :created, location: @turn_scheme }
      else
        format.html { render :new }
        format.json { render json: @turn_scheme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turn_schemes/1
  # PATCH/PUT /turn_schemes/1.json
  def update
    @turn_scheme.transaction do
      @turn_scheme.exclusion_days.clear
      unless params[:day].nil?
        params[:day].each_with_index do |i, index|
          dates=i.split(',')

          dates.each do |d|
            dt=d.to_date
            ExclusionDay.find_or_create_by(day: dt, turn_type_id: params[:turn_type_id][index], turn_scheme_id: @turn_scheme.id)
          end
        end
      end

    end
    respond_to do |format|
      if @turn_scheme.update(turn_scheme_params)
        format.html { redirect_to turn_schemes_path, notice: 'Схема смен была обновлена.' }
        format.json { render :show, status: :ok, location: @turn_scheme }
      else
        format.html { render :edit }
        format.json { render json: @turn_scheme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turn_schemes/1
  # DELETE /turn_schemes/1.json
  def destroy
    @turn_scheme.destroy
    respond_to do |format|
      format.html { redirect_to turn_schemes_url, notice: 'Схема смен была удалена.' }
      format.json { head :no_content }
    end
  end

  private

  def validate_access
    unless @can_manage_org_structure
      respond_to do |format|
        format.any { render nothing: true, :status => :forbidden }
      end
    end

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_turn_scheme
    @turn_scheme = TurnScheme.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def turn_scheme_params
    params[:turn_scheme].permit(:name, :comment, :turn_type_id)
  end
end
