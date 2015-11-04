class ControlListQuarterFactorsController < ApplicationController
  before_action :set_control_list_quarter_factor, only: [:show, :edit, :update, :destroy]
  before_action :check_permission, :validate_access

  # GET /control_list_quarter_factors
  # GET /control_list_quarter_factors.json
  def index
    @control_list_quarter_factors = ControlListQuarterFactor.all
  end

  # GET /control_list_quarter_factors/1
  # GET /control_list_quarter_factors/1.json
  def show
  end

  # GET /control_list_quarter_factors/new
  def new
    @control_list_quarter_factor = ControlListQuarterFactor.new
    @control_list_quarter_factor.order_num=ControlListQuarterFactor.count+1
  end

  # GET /control_list_quarter_factors/1/edit
  def edit
  end

  # POST /control_list_quarter_factors
  # POST /control_list_quarter_factors.json
  def create
    @control_list_quarter_factor = ControlListQuarterFactor.new(control_list_quarter_factor_params)

    respond_to do |format|
      if @control_list_quarter_factor.save
        format.html { redirect_to control_list_factors_path }
        format.json { render :show, status: :created, location: @control_list_quarter_factor }
      else
        format.html { render :new }
        format.json { render json: @control_list_quarter_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /control_list_quarter_factors/1
  # PATCH/PUT /control_list_quarter_factors/1.json
  def update
    respond_to do |format|
      if @control_list_quarter_factor.update(control_list_quarter_factor_params)
        format.html { redirect_to @control_list_quarter_factor }
        format.json { render :show, status: :ok, location: @control_list_quarter_factor }
      else
        format.html { render :edit }
        format.json { render json: @control_list_quarter_factor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /control_list_quarter_factors/1
  # DELETE /control_list_quarter_factors/1.json
  def destroy
    @control_list_quarter_factor.destroy
    respond_to do |format|
      format.html { redirect_to control_list_quarter_factors_url }
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
  def set_control_list_quarter_factor
    @control_list_quarter_factor = ControlListQuarterFactor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def control_list_quarter_factor_params
    params.require(:control_list_quarter_factor).permit(:order_num, :factor, :is_active, :comment, :control_list_quarter_factor_group_id)
  end
end
