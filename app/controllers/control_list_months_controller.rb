class ControlListMonthsController < ApplicationController
  before_action :set_control_list_month, only: [:show,:pdf, :edit, :update, :destroy]
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

  def pdf
    @control_list_links=ControlListMonthLink.includes(:control_list_factor, :control_list_factor_group, :user, :status).where(:control_list_month_id => @control_list_month.id)
    respond_to do |format|
      format.html { render :show, layout: false }
    end
  end

  # GET /control_list_months/new
  def new
    s_id=StaffRole.where(:can_fill_control_list => true).all.map { |s| s.id }
    @users=User.where('staff_role_id in (?)', s_id)
    @control_list_month = ControlListMonth.new

  end

  # GET /control_list_months/1/edit
  def edit
    s_id=StaffRole.where(:can_fill_control_list => true).all.map { |s| s.id }
    @users=User.where('staff_role_id in (?)', s_id)
    @control_list_links=ControlListMonthLink.where(:control_list_month_id => @control_list_month.id)
  end

  # POST /control_list_months
  # POST /control_list_months.json
  def create
    ControlListMonth.transaction do
      @control_list_month = ControlListMonth.new(control_list_month_params)
      if !params[:factors].nil? && @control_list_month.save
        params[:factors].each_with_index do |item, index|

          if params[:is_enabled][index]
            g_id, f_id=params[:factors][index].gsub('cb_', '').split('_')
            c=ControlListMonthLink.new
            c.control_list_month_id=@control_list_month.id
            c.control_list_factor_group_id=g_id
            c.control_list_factor_id=f_id
            c.user_id=params[:f_user_id][index]
            c.inconsistency=params[:inconsistence][index]
            c.note_due=params[:note_due][index]
            c.note_measures=params[:note_measures][index]
            c.status_id=params[:f_status_id][index]
            c.save!
          end
        end


      end
    end
    respond_to do |format|
      if @control_list_month.save
        format.html { redirect_to control_list_months_path }
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


    @control_list_month.update_attributes(control_list_month_params)
    ControlListMonthLink.where(:control_list_month_id => @control_list_month.id).delete_all
    params[:is_enabled].each_with_index do |item, index|

      if params[:is_enabled][index]=='true'
        g_id, f_id=params[:cb_factors][index].split('_')


        c=ControlListMonthLink.new
        c.control_list_month_id = @control_list_month.id
        c.control_list_factor_group_id=g_id
        c.control_list_factor_id=f_id
        c.save!
        c.user_id=params[:f_user_id][index]
        c.inconsistency=params[:inconsistence][index]
        c.note_due=params[:note_due][index]
        c.note_measures=params[:note_measures][index]
        c.status_id=params[:f_status_id][index]
        c.save!
      end
    end

    respond_to do |format|
      format.html { redirect_to control_list_months_path }
      format.json { render :show, status: :ok, location: @control_list_month }
    end

  end

  # DELETE /control_list_months/1
  # DELETE /control_list_months/1.json
  def destroy
    @control_list_month.destroy
    respond_to do |format|
      format.html { redirect_to control_list_months_url }
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
    params.require(:control_list_month).permit!
  end
end
