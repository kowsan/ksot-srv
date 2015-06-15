class ManagementsController < ApplicationController
  before_action :set_management, only: [:show, :edit, :update, :destroy]
  before_action :check_permission, :validate_access

  # GET /managements
  # GET /managements.json
  def index
    @managements = Management.all
  end

  # GET /managements/1
  # GET /managements/1.json
  def show
  end

  # GET /managements/new
  def new
    @management = Management.new
  end

  # GET /managements/1/edit
  def edit
  end

  # POST /managements
  # POST /managements.json
  def create
    @management = Management.new(management_params)

    respond_to do |format|
      if @management.save
        format.html { redirect_to @management, notice: 'Management was successfully created.' }
        format.json { render :show, status: :created, location: @management }
      else
        format.html { render :new }
        format.json { render json: @management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managements/1
  # PATCH/PUT /managements/1.json
  def update
    respond_to do |format|
      if @management.update(management_params)
        format.html { redirect_to @management, notice: 'Management was successfully updated.' }
        format.json { render :show, status: :ok, location: @management }
      else
        format.html { render :edit }
        format.json { render json: @management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managements/1
  # DELETE /managements/1.json
  def destroy
    if @management.can_delete?
      @management.destroy
      respond_to do |format|
        format.html { redirect_to managements_url, notice: 'Management was successfully destroyed.' }
        format.json { head :no_content }
      end
    else

      respond_to do |format|
        format.html { redirect_to managements_url,:status => :forbidden }
        format.json { head :no_content,:status => :forbidden }
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
  def set_management
    @management = Management.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def management_params
    params[:management].permit(:name, :short_name)
  end
end
