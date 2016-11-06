class WorkerSchedulesController < ApplicationController

	def create
		@worker = DockWorker.find(params[:worker_id])
		@appointment = Appointment.find(params[:appointment_id])
		@timeslot = Timeslot.find(params[:timeslot_id])
		@worker.worker_schedules.create(timeslot_id: params[:timeslot_id])
		@appointment.shipments.create(dock_worker_id: @worker.id)
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@worker = DockWorker.find(params[:worker_id])
		@timeslot = Timeslot.find(params[:timeslot_id])
		@worker_schedule = @worker.worker_schedules.where(timeslot_id: params[:timeslot_id]).first
		@worker_schedule.destroy
		puts params[:worker_id]
		puts params[:timeslot_id]
		puts params[:appointment_id]
		@appointment = Appointment.find(params[:appointment_id])
		@shipment = @appointment.shipments.where(dock_worker_id: params[:worker_id]).first
		@shipment.destroy
		respond_to do |format|
			format.js
		end
	end

	def demo
	end
end
