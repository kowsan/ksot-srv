class ControlListMonthsController < ApplicationController
  before_action :set_control_list_month, only: [:show, :edit, :update, :destroy]
   before_action :check_permission
  # GET /control_list_months
  # GET /control_list_months.json
  def index
    @control_list_months = ControlListMonth.all
  end

  # GET /control_list_months/1
  # GET /control_list_months/1.json
  def show
  end

  # GET /control_list_months/new
  def new
    @control_list_month = ControlListMonth.new

  end

  # GET /control_list_months/1/edit
  def edit
  end

  # POST /control_list_months
  # POST /control_list_months.json
  def create
    @control_list_month = ControlListMonth.new(control_list_month_params)

    respond_to do |format|
      if @control_list_month.save
        format.html { redirect_to @control_list_month, notice: 'Control list month was successfully created.' }
        format.json { render :show, status: :created, location: @control_list_month }
      else
        format.html { render :new }
        format.json { render json: @control_list_month.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /control_list_months/1
  # PATCH/PUT /control_list_months/1.json
  def update
    respond_to do |format|
      if @control_list_month.update(control_list_month_params)
        format.html { redirect_to @control_list_month, notice: 'Control list month was successfully updated.' }
        format.json { render :show, status: :ok, location: @control_list_month }
      else
        format.html { render :edit }
        format.json { render json: @control_list_month.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /control_list_months/1
  # DELETE /control_list_months/1.json
  def destroy
    @control_list_month.destroy
    respond_to do |format|
      format.html { redirect_to control_list_months_url, notice: 'Control list month was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_control_list_month
      @control_list_month = ControlListMonth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def control_list_month_params
      params.require(:control_list_month).permit(:form_date)
    end
end
