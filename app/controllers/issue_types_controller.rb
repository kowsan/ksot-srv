class IssueTypesController < ApplicationController
  before_action :set_issue_type, only: [:show, :edit, :update, :destroy,:enable]
  before_action :check_permission, :validate_access

  # GET /issue_types
  # GET /issue_types.json
  def index
    @issue_types = IssueType.unscoped.order('is_enabled desc').all
  end

  # GET /issue_types/1
  # GET /issue_types/1.json
  def show
  end

  # GET /issue_types/new
  def new
    @issue_type = IssueType.new

  end

  # GET /issue_types/1/edit
  def edit
  end

  # POST /issue_types
  # POST /issue_types.json
  def create
    @issue_type = IssueType.new(issue_type_params)

    respond_to do |format|
      if @issue_type.save
        format.html { redirect_to issue_types_path, notice: 'Вид нарушений успешно создан.' }
        format.json { render :show, status: :created, location: @issue_type }
      else
        format.html { render :new }
        format.json { render json: @issue_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issue_types/1
  # PATCH/PUT /issue_types/1.json
  def update
    respond_to do |format|
      if @issue_type.update(issue_type_params)
        format.html { redirect_to issue_types_path, notice: 'Вид нарушений успешно обновлен' }
        format.json { render :show, status: :ok, location: @issue_type }
      else
        format.html { render :edit }
        format.json { render json: @issue_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issue_types/1
  # DELETE /issue_types/1.json
  def destroy
    #@issue_type.destroy
    @issue_type.is_enabled=false
    # @issue_type.work_spaces.clear
    @issue_type.save!
    respond_to do |format|
      format.html { redirect_to issue_types_path, notice: 'Вид нарушений успешно удален.' }
      format.json { head :no_content }
    end
  end


  def enable

    #@issue_type.destroy
    @issue_type.is_enabled=true
    # @issue_type.work_spaces.clear
    @issue_type.save!
    respond_to do |format|
      format.html { redirect_to issue_types_path, notice: 'Вид нарушений успешно задействован.' }
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
  def set_issue_type
    @issue_type = IssueType.unscoped.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_type_params
    params.require(:issue_type).permit(:name, :critical_type_id)
  end
end
