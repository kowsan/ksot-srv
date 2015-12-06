class ReportController < ApplicationController
  before_action :check_permission

  def index
    if params[:year]
      @date=DateTime.new(params[:year].to_i)
    else
      @date=DateTime.current
    end
  end
end
