class TurnTypesController < ApplicationController
  before_action :set_turn_type, only: [:show, :edit, :update, :destroy]

  # GET /turn_types
  # GET /turn_types.json
  def index
    @turn_types = TurnType.all
  end

  # GET /turn_types/1
  # GET /turn_types/1.json
  def show
  end

  # GET /turn_types/new
  def new
    @turn_type = TurnType.new
    @turn_type.reminder_before_end=15
    @turn_type.first_start_at=Time.current.at_beginning_of_day+ 8.hours
    @turn_type.first_duration=Time.current.at_beginning_of_day+9.hours-1.minute
    @turn_type.second_start_at=Time.current.at_beginning_of_day+17.hours
    @turn_type.second_duration=Time.current.at_beginning_of_day+24.hours-1.minute
  end

  # GET /turn_types/1/edit
  def edit
  end

  # POST /turn_types
  # POST /turn_types.json
  def create
    @turn_type = TurnType.new(turn_type_params)

    respond_to do |format|
      if @turn_type.save
        format.html { redirect_to @turn_type, notice: 'Turn type was successfully created.' }
        format.json { render :show, status: :created, location: @turn_type }
      else
        format.html { render :new }
        format.json { render json: @turn_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turn_types/1
  # PATCH/PUT /turn_types/1.json
  def update
    respond_to do |format|
      if @turn_type.update(turn_type_params)
        format.html { redirect_to @turn_type, notice: 'Turn type was successfully updated.' }
        format.json { render :show, status: :ok, location: @turn_type }
      else
        format.html { render :edit }
        format.json { render json: @turn_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turn_types/1
  # DELETE /turn_types/1.json
  def destroy
    @turn_type.destroy
    respond_to do |format|
      format.html { redirect_to turn_types_url, notice: 'Turn type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turn_type
      @turn_type = TurnType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def turn_type_params
      params.require(:turn_type).permit(:name, :first_start_at, :first_duration, :second_start_at, :second_duration, :reminder_before_end, :is_day_off)
    end
end
