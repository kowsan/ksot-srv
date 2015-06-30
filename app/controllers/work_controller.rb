class WorkController < ApplicationController
  before_action :check_permission, :except => [:app_login, :app_logout, :user_info]

  def user_info
    @allow_anon='false'

    if current_user
      @allow_anon='you authed'
      check_permission

    else
      @allow_anon=AutoWorkSpace.can_anonymous?(cookies[:app_id])
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

    x= a.save!
    if x
      cookies[:app_id]=app_id
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
