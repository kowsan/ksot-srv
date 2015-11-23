class WorkController < ApplicationController
  before_action :check_permission, :except => [:app_login, :app_logout, :user_info, :by_day_in_month, :by_ws_id]

  def by_ws_id
    ws=AutoWorkSpace.current_aws(cookies[:app_id])
    if ws.nil?
      @allow_anon=false
    else
      if ws.work_spaces.count==0
        @allow_anon=false
      else
        @allow_anon=ws.allow_anonymous?
      end
    end
    if current_user
      @allow_anon='you authed'
      check_permission
      @workspaces= get_available_work_spaces
      if @workspaces.nil?
        @allow_anon=false
      end

    else
      @workspaces= get_available_work_spaces
      if @workspaces.nil?
        @allow_anon=false
      end
    end
  end

  def user_info

    ws=AutoWorkSpace.current_aws(cookies[:app_id])
    if ws.nil?
      @allow_anon=false
    else
      if ws.work_spaces.count==0
        @allow_anon=false
      else
        @allow_anon=ws.allow_anonymous?
      end
    end
    if current_user
      @allow_anon='you authed'
      check_permission
      @workspaces= get_available_work_spaces
      if @workspaces.nil?
        @allow_anon=false
      end

    else
      @workspaces= get_available_work_spaces
      if @workspaces.nil?
        @allow_anon=false
      end
    end


  end

  def by_day_in_month

    ws=AutoWorkSpace.current_aws(cookies[:app_id])
    if ws.nil?
      @allow_anon=false
    else
      if ws.work_spaces.count==0
        @allow_anon=false
      else
        @allow_anon=ws.allow_anonymous?
      end
    end
    if current_user
      @allow_anon='you authed'
      check_permission
      @workspaces= get_available_work_spaces
      if @workspaces.nil?
        @allow_anon=false
      end

    else
      @workspaces= get_available_work_spaces
      if @workspaces.nil?
        @allow_anon=false
      end
    end

  end

  def summary

  end

  def app_login
    app_id=app_params[:app_id] || ''
    name=app_params[:name] || ''
    os = app_params[:os] || ''
    osuser = app_params[:os_user] || ''
    a = AutoWorkSpace.where(:uuid => app_id).first_or_create(:computername => name, :os => os, :os_user => osuser)
    tms=Array.new
    a.work_spaces.all.each do |w|
      tms<<TurnType.turn_times(w.id)
    end
    a.turn_times=tms
    a.computername=name
    a.os=os
    a.os_user=osuser
    a.updated_at=Time.current
    x= a.save!





    if x
      cookies[:app_id]=app_id
      if current_user
        check_permission
        a[:deny_close]=false if @can_shutdown_app

      end

    a.comment=tms
      respond_to do |format|
        format.json { render :json => a.to_json, :status => :created }
      end
    end


  end

  def app_logout
  end

  private
  def app_params
    #protect any params
    params.permit(:app_id, :name, :os, :os_user, :format)
  end
end
