class ControlListFactorsController < ApplicationController
  before_action :set_control_list_factor, only: [:show, :edit, :update, :destroy,:enable]
  before_action :check_permission,:validate_access

  # GET /control_list_factors
  # GET /control_list_factors.json
  def index
    @control_list_factors = ControlListFactor.unscoped.all
  end

  # GET /control_list_factors/1
  # GET /control_list_factors/1.json
  def show
  end

  # GET /control_list_factors/new
  def new
    @control_list_factor = ControlListFactor.new
  end

  # GET /control_list_factors/1/edit
  def edit
  end

  # POST /control_list_factors
  # POST /control_list_factors.json
  def create
    @control_list_factor = ControlListFactor.new(control_list_factor_params)

    respond_to do |format|
      if @control_list_factor.save
        format.html { redirect_to control_list_factors_path, notice: '' }
        format.json { render :show, status: :created, location: @control_list_factor }
      else
        format.html { render :new }
        format.json { render json: @control_list_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /control_list_factors/1
  # PATCH/PUT /control_list_factors/1.json
  def update
    respond_to do |format|
      if @control_list_factor.update(control_list_factor_params)
        format.html { redirect_to control_list_factors_url, notice: '' }
        format.json { render :show, status: :ok, location: @control_list_factor }
      else
        format.html { render :edit }
        format.json { render json: @control_list_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /control_list_factors/1
  # DELETE /control_list_factors/1.json
  def destroy
    @control_list_factor.block
    respond_to do |format|
      format.html { redirect_to control_list_factors_url, notice: 'Control list factor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def enable
    @control_list_factor.block
    respond_to do |format|
      format.html { redirect_to control_list_factors_url, notice: 'Control list factor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def validate_access
    unless @can_fill_control_list
      respond_to do |format|
        format.any { render nothing: true, :status => :forbidden }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_control_list_factor
      @control_list_factor = ControlListFactor.unscoped.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def control_list_factor_params
      params.require(:control_list_factor).permit(:order_num, :factor, :is_active, :comment,:control_list_factor_group_id)
    end
end
