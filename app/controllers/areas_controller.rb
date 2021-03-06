class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]
  before_action :check_permission,:validate_access

  # GET /areas
  # GET /areas.json
  def index
    @areas = Area.all
  end

  # GET /areas/1
  # GET /areas/1.json
  def show
  end

  # GET /areas/new
  def new
    @area = Area.new
  end

  # GET /areas/1/edit
  def edit
  end

  # POST /areas
  # POST /areas.json
  def create
    @area = Area.new(area_params)

    respond_to do |format|
      if @area.save
        format.html { redirect_to areas_path, notice: 'Участок успешно создан' }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areas/1
  # PATCH/PUT /areas/1.json
  def update
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to areas_path notice: 'Участок был обновлен.' }
        format.json { render :show, status: :ok, location: @area }
      else
        format.html { render :edit }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy
    if @area.can_delete?
      @area.destroy!
      respond_to do |format|
        format.html { redirect_to areas_url, notice: 'Участок был удален.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to areas_path,:status => :forbidden }
        format.json { head :forbidden }
      end
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
  def set_area
    @area = Area.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def area_params
    params[:area].permit(:name, :short_name, :management_id)
  end
end
