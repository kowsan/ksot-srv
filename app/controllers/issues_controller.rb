class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action :check_permission, :validate_access_ws, :except => [:monthly, :next_date, :monthly_by_day]
  before_action :set_filter_ws, only: [:index, :monthly, :assigned, :owned, :new]

  def days_in_month
    params[:month]
    params[:year]
    res=Time.days_in_month(params[:month].to_i, params[:year].to_i)
    respond_to do |format|
      format.json { render :json => res }
    end
  end

  def unreaded
    count=Issue.unreaded_issues(current_user.id)
    q=Hash.new
    q[:count]=count
    respond_to do |format|
      format.json { render :json => q.to_json }
    end
  end

  def next_date
    offset=params[:offset] || 0
    date=Date.strptime(params[:date].to_s, "%m.%Y") || Date.current
    date=date+offset.to_i.month
    out=date.to_datetime.strftime("%m.%Y")

    respond_to do |format|
      format.json { render :json => out.to_json }
    end
  end

  def monthly_by_day
    @out=Array.new
    date=Date.strptime(params[:date].to_s, "%m.%Y") || Date.current
    (date.at_beginning_of_month.yday..date.at_end_of_month.yday).each do |d|


      cd=(date.at_beginning_of_year+d-1).to_date

      if Date.current >= cd

        # clr=Issue.max_on_day(cd,ws_id)
        clr=Issue.max_on_day(cd)
      else
        clr='#333333'

      end
      h=Hash.new
      h["c"]=clr
      @out << h

    end
  end


  def monthly

    ws_id=params[:work_space_id]
    #  w_spaces=WorkSpace.find(ws_id)
    @out=Array.new
    date=Date.strptime(params[:date].to_s, "%m.%Y") || Date.current
    (date.at_beginning_of_month.yday..date.at_end_of_month.yday).each do |d|


      cd=(date.at_beginning_of_year+d-1).to_date
      ## puts d,cd
      if Date.current >= cd

        # clr=Issue.max_on_day(cd,ws_id)
        clr=Issue.max_on(cd, ws_id)
      else
        #check for wyh
        sc= Issue.smene_count(cd, ws_id)
        case sc
          when 0
            clr='#333333'
          when 1
            clr='#FCFCFC'
          when 2
            clr='#FCFCFC,#FCFCFC'
        end


      end
      h=Hash.new
      h["c"]=clr
      @out << h

    end


  end

  def index
    puts @ws
    begin
      @from_t=Time.strptime((params[:from_t] || '00:00'), "%H:%M")
      @from=Time.strptime(params[:from], "%d.%m.%Y")
      @from =@from+@from_t.hour.hours+@from_t.min.minutes
    rescue
      @from= Time.current.at_beginning_of_month
    end
    begin
      @to_t=Time.strptime((params[:to_t] || '23:59'), "%H:%M")
      @to=Time.strptime(params[:to], "%d.%m.%Y")
      @to =@to+@to_t.hour.hours+@to_t.min.minutes
    rescue
      @to=Time.current.at_end_of_month
    end
    @issues = Issue.includes(:issue_type, :status, :author, :violator, :assigned, :work_space).where(:created_at => @from.in_time_zone..@to.in_time_zone).where('work_space_id in (?)', @ws)

  end


  def assigned
    Issue.mark_as_readed(current_user.id)
    begin
      @from_t=Time.strptime((params[:from_t] || '00:00'), "%H:%M")
      @from=Time.strptime(params[:from], "%d.%m.%Y")
      @from =@from+@from_t.hour.hours+@from_t.min.minutes
    rescue
      @from= Time.current.at_beginning_of_month
    end
    begin
      @to_t=Time.strptime((params[:to_t] || '23:59'), "%H:%M")
      @to=Time.strptime(params[:to], "%d.%m.%Y")
      @to =@to+@to_t.hour.hours+@to_t.min.minutes
    rescue
      @to=Time.current.at_end_of_month
    end
    @issues = Issue.includes(:issue_type, :status, :author, :violator, :assigned, :work_space).where(:assigned_id => @current_user_id).where(:created_at => @from..@to).where('work_space_id in (?)', @ws)
  end


  def owned

    begin
      @from_t=Time.strptime((params[:from_t] || '00:00'), "%H:%M")
      @from=Time.strptime(params[:from], "%d.%m.%Y")
      @from =@from+@from_t.hour.hours+@from_t.min.minutes
    rescue
      @from= Time.current.at_beginning_of_month
    end
    begin
      @to_t=Time.strptime((params[:to_t] || '23:59'), "%H:%M")
      @to=Time.strptime(params[:to], "%d.%m.%Y")
      @to =@to+@to_t.hour.hours+@to_t.min.minutes
    rescue
      @to=Time.current.at_end_of_month
    end
    @issues = Issue.includes(:issue_type, :status, :author, :violator, :assigned, :work_space).where(:author_id => @current_user_id).where(:created_at => @from..@to).where('work_space_id in (?)', @ws)
  end

# GET /issues/1
# GET /issues/1.json
  def show
  end

# GET /issues/new
  def new


    @issue = Issue.new

  end

# GET /issues/1/edit
  def edit
    @workspaces=get_available_work_spaces
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

  def set_filter_ws
    @workspaces=get_available_work_spaces
    @ws=Array.new
    if params[:work_space].nil?
      q=WorkSpace.all
      q.each do |m|
        @ws<<m.id
      end

    else
      w_ids=params[:work_space][:id]
      if w_ids.class==Array
        q=WorkSpace.find(w_ids.to_a.reject { |a| a.blank? })
        if q.empty?
          q=WorkSpace.all
        end
        q.each do |m|
          @ws<<m.id
        end
      else
        @ws<<WorkSpace.find(w_ids).id
      end

    end
  end


# Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:violator_id, :status_id, :clarification, :issue_type_id, :assigned_id, :close_date, :note_due, :due_date, :note_measures, :work_space_id)
  end

end
