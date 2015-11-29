class ControlListQuartersController < ApplicationController
  before_action :set_control_list_quarter, only: [:show, :edit, :update, :destroy]

  # GET /control_list_quarters
  # GET /control_list_quarters.json
  def index
    @control_list_quarters = ControlListQuarter.all
  end

  # GET /control_list_quarters/1
  # GET /control_list_quarters/1.json
  def show
  end

  # GET /control_list_quarters/new
  def new
    @control_list_quarter = ControlListQuarter.new
  end

  # GET /control_list_quarters/1/edit
  def edit
  end

  # POST /control_list_quarters
  # POST /control_list_quarters.json
  def create
    @control_list_quarter = ControlListQuarter.new(control_list_quarter_params)

    respond_to do |format|
      if @control_list_quarter.save
        format.html { redirect_to @control_list_quarter, notice: 'Control list quarter was successfully created.' }
        format.json { render :show, status: :created, location: @control_list_quarter }
      else
        format.html { render :new }
        format.json { render json: @control_list_quarter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /control_list_quarters/1
  # PATCH/PUT /control_list_quarters/1.json
  def update
    respond_to do |format|
      if @control_list_quarter.update(control_list_quarter_params)
        format.html { redirect_to @control_list_quarter, notice: 'Control list quarter was successfully updated.' }
        format.json { render :show, status: :ok, location: @control_list_quarter }
      else
        format.html { render :edit }
        format.json { render json: @control_list_quarter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /control_list_quarters/1
  # DELETE /control_list_quarters/1.json
  def destroy
    @control_list_quarter.destroy
    respond_to do |format|
      format.html { redirect_to control_list_quarters_url, notice: 'Control list quarter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_control_list_quarter
      @control_list_quarter = ControlListQuarter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def control_list_quarter_params
      params.require(:control_list_quarter).permit(:form_date, :author_id, :subdivision_id)
    end
end
