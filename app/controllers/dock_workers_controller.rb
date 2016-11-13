class DockWorkersController < ApplicationController
  before_action :set_dock_worker, only: [:show, :edit, :update, :archived, :destroy,:payment,:make_payment]

  # GET /dock_workers
  # GET /dock_workers.json
  def index
    @dock_workers = DockWorker.where.not(archived: true).paginate(page: params[:page],per_page: 5)
  end

  # GET /dock_workers/1
  # GET /dock_workers/1.json
  def show
  end

  # GET /dock_workers/new
  def new
    @dock_worker = DockWorker.new
  end

  # GET /dock_workers/1/edit
  def edit
  end

  # POST /dock_workers
  # POST /dock_workers.json
  def create
    @dock_worker = DockWorker.new(dock_worker_params)
    @dock_worker.last_payment_date = Date.today

    respond_to do |format|
      if @dock_worker.save
        format.html { redirect_to @dock_worker, notice: 'Dock worker was successfully created.' }
        format.json { render :show, status: :created, location: @dock_worker }
      else
        format.html { render :new }
        format.json { render json: @dock_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dock_workers/1
  # PATCH/PUT /dock_workers/1.json
  def update
    respond_to do |format|
      if @dock_worker.update(dock_worker_params)
        format.html { redirect_to @dock_worker, notice: 'Dock worker was successfully updated.' }
        format.json { render :show, status: :ok, location: @dock_worker }
      else
        format.html { render :edit }
        format.json { render json: @dock_worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # ARCHIVE /workers/1
  def archived
    # @worker.archived = true
    # @worker.save
    @dock_worker.update_attribute(:archived, true)
    redirect_to dock_workers_path, notice: 'Dock worker was successfully archived.'
  end


  # DELETE /dock_workers/1
  # DELETE /dock_workers/1.json
  def destroy
    @dock_worker.destroy
    respond_to do |format|
      format.html { redirect_to dock_workers_url, notice: 'Dock worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def report
    @dock_worker = DockWorker.find(params["report"]["id"])
    @start_date = Date.new params["report"]["start_date(1i)"].to_i,params["report"]["start_date(2i)"].to_i,params["report"]["start_date(3i)"].to_i
    @end_date = Date.new params["report"]["end_date(1i)"].to_i,params["report"]["end_date(2i)"].to_i,params["report"]["end_date(3i)"].to_i
    @totaldays = (@end_date - @start_date).to_i
    @timeslots = @dock_worker.timeslots.where(date: (@start_date..@end_date))
    puts @timeslots.count
    respond_to do |format|
      format.js
    end
  end

  def payment
    @timeslots = @dock_worker.timeslots.where(date: (@dock_worker.last_payment_date..Date.yesterday))
    @total_days = (Date.yesterday - @dock_worker.last_payment_date).to_i
    @payment_due = @timeslots.count* @dock_worker.pay_rate
    respond_to do |format|
      format.js
    end
  end

  def make_payment
    @dock_worker.last_payment_date = Date.yesterday
    @dock_worker.save
    @timeslots = @dock_worker.timeslots.where(date: (@dock_worker.last_payment_date..Date.yesterday))
    @total_days = (Date.yesterday - @dock_worker.last_payment_date).to_i
    @payment_due = @timeslots.count* @dock_worker.pay_rate
    respond_to do |format|
      format.js
    end
  end

  def avg_payroll
    @start_date = Date.new params["report"]["start_date(1i)"].to_i,params["report"]["start_date(2i)"].to_i,params["report"]["start_date(3i)"].to_i
    @end_date = Date.new params["report"]["end_date(1i)"].to_i,params["report"]["end_date(2i)"].to_i,params["report"]["end_date(3i)"].to_i
    @totaldays = (@end_date - @start_date).to_i
    @timeslots = Timeslot.all.where(date: (@start_date..@end_date))
    @total_appointments = 0
    @total_payroll = 0
    @timeslots.each do |timeslot|
      @total_appointments = @total_appointments + timeslot.appointments.count
      timeslot.dock_workers.each do |dock_worker|
        @total_payroll = @total_payroll + dock_worker.pay_rate
      end
    end
    if @total_appointments != 0
      @avg_payroll = @total_payroll/@total_appointments
    else
      @avg_payroll = 0
    end
    respond_to do |format|
      format.js
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dock_worker
      @dock_worker = DockWorker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dock_worker_params
      params.require(:dock_worker).permit(:last_name, :first_name, :address, :state_id, :zipcode, :pay_rate, :archived)
    end
end
