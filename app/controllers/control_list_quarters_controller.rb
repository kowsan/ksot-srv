class ControlListQuartersController < ApplicationController
  before_action :set_control_list_quarter, only: [:show, :edit, :update, :destroy]
  before_action :check_permission
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
    s_id=StaffRole.where(:can_fill_control_list => true).all.map { |s| s.id }
    @users=User.where('staff_role_id in (?)', s_id)
    @control_list_quarter = ControlListQuarter.new
  end

  # GET /control_list_quarters/1/edit
  def edit
    s_id=StaffRole.where(:can_fill_control_list => true).all.map { |s| s.id }
    @users=User.where('staff_role_id in (?)', s_id)
    @control_list_links=ControlListQuarterLink.where(:control_list_quarter_id => @control_list_quarter.id)
  end

  # POST /control_list_quarters
  # POST /control_list_quarters.json
  def create


    ControlListQuarter.transaction do
      @control_list_quarter = ControlListQuarter.new(control_list_quarter_params)
      if !params[:factors].nil? && @control_list_quarter.save
        params[:factors].each_with_index do |item, index|

          if params[:is_enabled][index]
            g_id, f_id=params[:factors][index].gsub('cb_', '').split('_')
            c=ControlListQuarterLink.new
            c.control_list_quarter_id=@control_list_quarter.id
            c.control_list_quarter_factor_group_id=g_id
            c.control_list_quarter_factor_id=f_id
            c.user_id=params[:f_user_id][index]
            c.inconsistency=params[:inconsistence][index]
            c.note_due=params[:note_due][index]
            c.date_due=params[:date_due][index]
            c.note_measures=params[:note_measures][index]
            c.status_id=params[:f_status_id][index]
            c.save!
          end
        end

      end
    end

    respond_to do |format|
      if @control_list_quarter.save
        format.html { redirect_to control_list_quarters_url, notice: 'Control list quarter was successfully created.' }
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
    @control_list_quarter.update_attributes(control_list_quarter_params)
    ControlListQuarterLink.where(:control_list_quarter_id => @control_list_quarter.id).delete_all
    params[:is_enabled].each_with_index do |item, index|

      if params[:is_enabled][index]=='true'
        g_id, f_id=params[:cb_factors][index].split('_')


        c=ControlListQuarterLink.new
        c.control_list_quarter_id = @control_list_quarter.id
        c.control_list_quarter_factor_group_id=g_id
        c.control_list_quarter_factor_id=f_id

        c.user_id=params[:f_user_id][index]
        c.inconsistency=params[:inconsistence][index]
        c.note_due=params[:note_due][index]
        c.date_due=params[:date_due][index]
        c.note_measures=params[:note_measures][index]
        c.status_id=params[:f_status_id][index]
        c.save!
      end
    end
    respond_to do |format|
      if @control_list_quarter.update(control_list_quarter_params)
        format.html { redirect_to control_list_quarters_url, notice: 'Control list quarter was successfully updated.' }
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
    params.require(:control_list_quarter).permit!
  end
end
