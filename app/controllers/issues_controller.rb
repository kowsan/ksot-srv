class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action :check_permission, :validate_access_ws

  # GET /issues
  # GET /issues.json


  def monthly
    out=Array.new
    date=params[:date].to_date || Date.current
    (date.at_beginning_of_month.yday..date.at_end_of_month.yday).each do |d|


      cd=(date.at_beginning_of_year+d-1).to_date
      ## puts d,cd
      iss= Issue.includes(:critical_type).where('date(issues.created_at) =?', cd).maximum(:weight) || 0


      if iss==0
        clr='white'
      else
       clr=CriticalType.where(:weight => iss).first.color.to_s
      end
      h=Hash.new
      h["day_#{cd.day}"]=clr
      out << h

    end

    puts out
    respond_to do |format|
      format.json{ render :json => out.to_json}
    end

  end

  def index
    @issues = Issue.includes(:issue_type, :status, :author, :violator, :assigned, :work_space).page params[:page]
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
  end

  # GET /issues/new
  def new
    get_ws
    @issue = Issue.new

  end

  # GET /issues/1/edit
  def edit
    get_ws
    unless @can_edit_issue
      respond_to do |format|
        format.any { render nothing: true, :status => :forbidden }
      end
    end
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)
    @issue.author =@logged_user

    respond_to do |format|
      if @issue.save
        format.html { redirect_to issues_url, notice: 'Нарушение успешно добавлено, №'+@issue.id.to_s }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to issues_url, notice: 'Нарушение №'+@issue.id.to_s+' обновлено.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Нарушение №'+@issue.id.to_s+' удалено.' }
      format.json { head :no_content }
    end
  end

  private
  def validate_access_ws


    unless @can_add_issue
      respond_to do |format|
        format.any { render nothing: true, :status => :forbidden }
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_issue

    @issue = Issue.find(params[:id])
  end

  def get_ws
    ws=AutoWorkSpace.find_by_uuid(cookies[:app_id])
    unless ws.nil?
      begin
        @issue_types=ws.work_space.issue_types
      rescue
        @issue_types=nil
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:violator_id, :status_id, :issue_type_id, :assigned_id, :close_date, :note_due, :due_date, :note_measures)
  end
end
