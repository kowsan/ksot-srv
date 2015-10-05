class UsersController < ApplicationController
  before_filter :check_permission
  before_filter :validate_access, except: :show
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users
  # GET /users.json
  def index
    @users = User.unscoped.includes(:staff_role).page params[:page]
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @readnonly=!@user.staff_role.can_manage_org_structure?
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Пользователь успешно создан' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    fp=params[:fromprofile] || false
    respond_to do |format|
      if @user.update(user_params)
        if fp
          format.html { redirect_to user_path @logged_user, notice: "Пользователь #{@user.login} обновлен" }
        else
          format.html { redirect_to users_path, notice: "Пользователь #{@user.login} обновлен" }
        end

        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def validate_access
    # unless @can_manage_org_structure
    #  respond_to do |format|
    #    format.any { render nothing: true, :status => :forbidden }
    #   end
    # end
    true
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user

    @user = User.unscoped.find(params[:id])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    if params[:user][:password].to_s==''
      params[:user].reject! { |x| x=='password' }
    end
    if @logged_user.staff_role.can_manage_org_structure?
      params[:user].permit(:login, :password, :first_name, :last_name, :middle_name, :staff_role_id, :subdivision_id, :is_active, :position)
    else
      params[:user].permit(:password, :position, :first_name, :last_name, :middle_name)
    end

  end

end
