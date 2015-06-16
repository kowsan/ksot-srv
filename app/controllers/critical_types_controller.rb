class CriticalTypesController < ApplicationController
  before_action :set_critical_type, only: [:show, :edit, :update, :destroy]

  # GET /critical_types
  # GET /critical_types.json
  def index
    @critical_types = CriticalType.all
  end

  # GET /critical_types/1
  # GET /critical_types/1.json
  def show
  end

  # GET /critical_types/new
  def new
    @critical_type = CriticalType.new
  end

  # GET /critical_types/1/edit
  def edit
  end

  # POST /critical_types
  # POST /critical_types.json
  def create
    @critical_type = CriticalType.new(critical_type_params)

    respond_to do |format|
      if @critical_type.save
        format.html { redirect_to @critical_type, notice: 'Critical type was successfully created.' }
        format.json { render :show, status: :created, location: @critical_type }
      else
        format.html { render :new }
        format.json { render json: @critical_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /critical_types/1
  # PATCH/PUT /critical_types/1.json
  def update
    respond_to do |format|
      if @critical_type.update(critical_type_params)
        format.html { redirect_to @critical_type, notice: 'Critical type was successfully updated.' }
        format.json { render :show, status: :ok, location: @critical_type }
      else
        format.html { render :edit }
        format.json { render json: @critical_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /critical_types/1
  # DELETE /critical_types/1.json
  def destroy
    @critical_type.destroy
    respond_to do |format|
      format.html { redirect_to critical_types_url, notice: 'Critical type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_critical_type
      @critical_type = CriticalType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def critical_type_params
      params.require(:critical_type).permit(:name)
    end
end
