class StatesController < ApplicationController
  before_action :set_state, only: [:show, :edit, :update, :destroy]

  # GET /states
  # GET /states.json
  def index
    @states = State.order('created_at DESC').paginate(
      page: params[:page], per_page: 10
    )
  end

  # GET /states/1
  # GET /states/1.json
  def show; end

  # GET /states/new
  def new
    @state = State.new
  end

  # GET /states/1/edit
  def edit; end

  # POST /states
  # POST /states.json
  def create
    @state = State.new(state_params)

    respond_to do |format|
      if @state.save
        format.html do
          redirect_to @state,
                      notice: 'State was successfully created.'
        end
        format.json { render :show, status: :created, location: @state }
      else
        format.html { render :new }
        format.json do
          render json: @state.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /states/1
  # PATCH/PUT /states/1.json
  def update
    respond_to do |format|
      if @state.update(state_params)
        format.html do
          redirect_to @state,
                      notice: 'State was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @state }
      else
        format.html { render :edit }
        format.json do
          render json: @state.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /states/1
  # DELETE /states/1.json
  def destroy
    @state.destroy
    respond_to do |format|
      format.html do
        redirect_to states_url,
                    notice: 'State was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_state
    @state = State.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def state_params
    params.require(:state).permit(:name)
  end
end
