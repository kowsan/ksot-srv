class ControlListQuarterFactorGroupsController < ApplicationController
  before_action :set_control_list_quarter_factor_group, only: [:show, :edit, :update, :destroy]
  before_action :check_permission,:validate_access

  # GET /control_list_quarter_factor_groups
  # GET /control_list_quarter_factor_groups.json
  def index
    @control_list_quarter_factor_groups = ControlListQuarterFactorGroup.all
  end

  # GET /control_list_quarter_factor_groups/1
  # GET /control_list_quarter_factor_groups/1.json
  def show
  end

  # GET /control_list_quarter_factor_groups/new
  def new
    @control_list_quarter_factor_group = ControlListQuarterFactorGroup.new
  end

  # GET /control_list_quarter_factor_groups/1/edit
  def edit
  end

  # POST /control_list_quarter_factor_groups
  # POST /control_list_quarter_factor_groups.json
  def create
    @control_list_quarter_factor_group = ControlListQuarterFactorGroup.new(control_list_quarter_factor_group_params)

    respond_to do |format|
      if @control_list_quarter_factor_group.save
        format.html { redirect_to control_list_quarter_factor_groups_path }
        format.json { render :show, status: :created, location: @control_list_quarter_factor_group }
      else
        format.html { render :new }
        format.json { render json: @control_list_quarter_factor_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /control_list_quarter_factor_groups/1
  # PATCH/PUT /control_list_quarter_factor_groups/1.json
  def update
    respond_to do |format|
      if @control_list_quarter_factor_group.update(control_list_quarter_factor_group_params)
        format.html { redirect_to control_list_quarter_factor_groups_path }
        format.json { render :show, status: :ok, location: @control_list_quarter_factor_group }
      else
        format.html { render :edit }
        format.json { render json: @control_list_quarter_factor_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /control_list_quarter_factor_groups/1
  # DELETE /control_list_quarter_factor_groups/1.json
  def destroy
    @control_list_quarter_factor_group.destroy
    respond_to do |format|
      format.html { redirect_to control_list_quarter_factor_groups_path}
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
    def set_control_list_quarter_factor_group
      @control_list_quarter_factor_group = ControlListQuarterFactorGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def control_list_quarter_factor_group_params
      params.require(:control_list_quarter_factor_group).permit(:order_num, :name)
    end
end
