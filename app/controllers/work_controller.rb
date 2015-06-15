class WorkController < ApplicationController
  before_action :check_permission, :except => [:app_login, :app_logout,]

  def user_info
    # @l=@logged_user
    #@r=@staff_role
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
      cookies['app_id']={:value => app_id, :expires => 2.years.from_now}
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
