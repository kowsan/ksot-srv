class AutoWorkSpacesController < ApplicationController
  before_action :set_auto_work_space, only: [:show, :edit, :update, :destroy]
  before_action :check_permission

  # GET /auto_work_spaces
  # GET /auto_work_spaces.json
  def index
    @all=AutoWorkSpace.unscoped.count
    @auto_work_spaces = AutoWorkSpace.all-AutoWorkSpace.unassigned
    #@auto_work_spaces = AutoWorkSpace.joins(:work_spaces).where('work_space_id is not null')
    @unassigned = AutoWorkSpace.unassigned

  end

  # GET /auto_work_spaces/1
  # GET /auto_work_spaces/1.json
  def show
  end

  # GET /auto_work_spaces/new
  def new
    @auto_work_space = AutoWorkSpace.new
  end

  # GET /auto_work_spaces/1/edit
  def edit
    @assigned=@auto_work_space.work_spaces
    @unassigned=WorkSpace.all- @auto_work_space.work_spaces
  end

  # POST /auto_work_spaces
  # POST /auto_work_spaces.json
  def create
    @auto_work_space = AutoWorkSpace.new(auto_work_space_params)

    respond_to do |format|
      if @auto_work_space.save
        format.html { redirect_to @auto_work_space, notice: 'Auto work space was successfully created.' }
        format.json { render :show, status: :created, location: @auto_work_space }
      else
        format.html { render :new }
        format.json { render json: @auto_work_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auto_work_spaces/1
  # PATCH/PUT /auto_work_spaces/1.json
  def update
    @auto_work_space.work_spaces.clear
    @auto_work_space.work_spaces << WorkSpace.find(params[:auto_work_space][:work_space_id]) unless params[:auto_work_space][:work_space_id].nil?


    respond_to do |format|
      if @auto_work_space.update(auto_work_space_params)
        format.html { redirect_to auto_work_spaces_path, notice: 'АРМ был обновлен' }
        format.json { render :show, status: :ok, location: @auto_work_space }
      else
        format.html { render :edit }
        format.json { render json: @auto_work_space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auto_work_spaces/1
  # DELETE /auto_work_spaces/1.json
  def destroy
    @auto_work_space.destroy

    respond_to do |format|
      format.html { redirect_to auto_work_spaces_url, notice: 'АРМ удалено' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_auto_work_space
    @auto_work_space = AutoWorkSpace.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def auto_work_space_params
    params[:auto_work_space].permit(:uuid, :is_used, :short_name, :os, :os_user, :location, :work_space_id, :deny_close, :allow_anonymous, :comment,)
  end
end
