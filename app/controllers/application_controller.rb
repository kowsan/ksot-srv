class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_filter :verify_authenticity_token
  protect_from_forgery
  # with: :null_session
  def check_permission
    authenticate_user!
    @logged_user = User.includes(:staff_role).find(current_user.id)
    @current_user_id = @logged_user.id
    @staff_role = @logged_user.staff_role
    @can_add_issue = @staff_role.can_add_issue?
    @can_edit_issue = @staff_role.can_edit_issue?
    @can_change_issue_status = @staff_role.can_change_issue_status?

    @can_shutdown_app = @staff_role.can_shutdown_app?

    @can_view_issue_report_local = @staff_role.can_view_issue_report_local?
    @can_view_issue_report_owned = @staff_role.can_view_issue_report_owned?

    @can_view_employees_list = @staff_role.can_view_employees_list?
    @can_view_aws_list_owned = @staff_role.can_view_aws_list_owned?

    @can_view_work_changes_owned = @staff_role.can_view_work_changes_owned?
    @can_fill_control_list = @staff_role.can_fill_control_list?
    @can_manage_org_structure=@staff_role.can_manage_org_structure?


  end

  def get_available_work_spaces
    begin
      if @logged_user.staff_role.area_owner?
        return @logged_user.subdivision.area.work_spaces

      end

      if @logged_user.staff_role.subdivision_owner?
        return @logged_user.subdivision.work_spaces

      end

      if @logged_user.staff_role.can_manage_org_structure?
        return WorkSpace.all
      end
      return AutoWorkSpace.current_aws(cookies[:app_id]).work_spaces.all
    rescue

      begin
        return AutoWorkSpace.current_aws(cookies[:app_id]).work_spaces.all
      rescue
        return nil
      end


    end


  end


end




