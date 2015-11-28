class TurnCloseInfoController < ApplicationController
  before_action :check_permission
  def index
    @tci=TurnCloseInfo.all

  end
end
