class SubdivisionsController < ApplicationController
  before_action :set_subdivision, only: [:show, :edit, :update, :destroy]
  before_action :check_permission, :validate_access

  # GET /subdivisions
  # GET /subdivisions.json
  def index
    @subdivisions = Subdivision.all
  end

  # GET /subdivisions/1
  # GET /subdivisions/1.json
  def show
  end

  # GET /subdivisions/new
  def new
    @subdivision = Subdivision.new
  end

  # GET /subdivisions/1/edit
  def edit
  end

  # POST /subdivisions
  # POST /subdivisions.json
  def create
    @subdivision = Subdivision.new(subdivision_params)

    respond_to do |format|
      if @subdivision.save
        format.html { redirect_to subdivisions_path, notice: 'Подразделение создано успешно.' }
        format.json { render :show, status: :created, location: @subdivision }
      else
        format.html { render :new }
        format.json { render json: @subdivision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subdivisions/1
  # PATCH/PUT /subdivisions/1.json
  def update
    respond_to do |format|
      if @subdivision.update(subdivision_params)
        format.html { redirect_to subdivisions_path, notice: 'Подразделение обновлено.' }
        format.json { render :show, status: :ok, location: @subdivision }
      else
        format.html { render :edit }
        format.json { render json: @subdivision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subdivisions/1
  # DELETE /subdivisions/1.json
  def destroy
    if @subdivision.users.count==0 && @subdivision.work_spaces.count==0
      @subdivision.destroy

    end
    respond_to do |format|
      format.html { redirect_to subdivisions_url, notice: 'Subdivision was successfully destroyed.' }
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

  # Use callbacks to share common setup or constraints between actions.
  def set_subdivision
    @subdivision = Subdivision.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.            validate_access
  def subdivision_params
    params[:subdivision].permit(:name, :short_name, :area_id)
  end
end
