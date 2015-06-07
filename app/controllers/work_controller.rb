class WorkController < ApplicationController
  def app_login
    app_id=params[:app_id] || ''
    name=params[:name]   || ''
    os = params[:os] || ''
    #TODO addos
    a=AutoWorkSpace.first_or_create(:uuid,app_id)
    a.save!



  end

  def app_logout
  end
end
