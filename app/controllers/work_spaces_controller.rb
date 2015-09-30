class WorkSpacesController < ApplicationController
  before_action :set_work_space, only: [:show, :edit, :update, :destroy, :enable]
  before_action :check_permission
  before_action :validate_access, :except => :get_issue_types

  # GET /work_spaces
  # GET /work_spaces.json
  def index
    @work_spaces = WorkSpace.unscoped.all
  end

  def get_issue_types
    ws=params[:work_space_id]
    @issue_types= WorkSpace.find(ws).issue_types
  end

  # GET /work_spaces/1
  # GET /work_spaces/1.json
  def show
  end

  # GET /work_spaces/new
  def new
    @work_space = WorkSpace.new
    @assigned=nil
    @other=IssueType.all
  end

  # GET /work_spaces/1/edit
  def edit

  end

  # POST /work_spaces
  # POST /work_spaces.json
  def create

    @work_space = WorkSpace.new(work_space_params)
    x= @work_space.save
    it=params[:work_space][:issue_type]
    @work_space.issue_types.clear
    @work_space.issue_types << IssueType.find(it) unless it.nil?
    respond_to do |format|
      if x
        format.html { redirect_to work_spaces_path, notice: 'Рабочее место создано.' }
        format.json { render :show, status: :created, location: @work_space }
      else
        format.html { render :new }
        format.json { render json: @work_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /work_spaces/1
  # PATCH/PUT /work_spaces/1.json
  def update
    it=params[:work_space][:issue_type]
    @work_space.issue_types.clear
    @work_space.issue_types << IssueType.find(it) unless it.nil?
    respond_to do |format|
      if @work_space.update(work_space_params)
        format.html { redirect_to work_spaces_path, notice: 'Рабочее место обновлено.' }
        format.json { render :show, status: :ok, location: @work_space }
      else
        format.html { render :edit }
        format.json { render json: @work_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /work_spaces/1
  # DELETE /work_spaces/1.json
  def destroy
    @work_space.block

    respond_to do |format|
      format.html { redirect_to work_spaces_path, notice: 'Рабочее место отключено.' }
      format.json { head :no_content }
    end
  end

  def enable
    @work_space.unblock
    respond_to do |format|
      format.html { redirect_to work_spaces_path, notice: 'Рабочее место задействовано.' }
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
  def set_work_space
    @work_space = WorkSpace.unscoped.find(params[:id])
    @assigned=@work_space.issue_types
    @other=IssueType.all-@assigned
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def work_space_params
    params[:work_space].permit(:name, :code, :short_name, :subdivision_id, :is_active, :issue_type, :turn_scheme_id)
  end
end
