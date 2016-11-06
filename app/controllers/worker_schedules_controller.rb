class WorkerSchedulesController < ApplicationController

	def create
		@worker = DockWorker.find(params[:worker_id])
		@appointment = Appointment.find(params[:appointment_id])

		@worker.worker_schedules.create(timeslot_id: params[:timeslot_id])
		@appointment.shipments.create(dock_worker_id: @worker.id)
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@worker = DockWorker.find(params[:worker_id])
		@timeslot = @worker.worker_schedules.where(timeslot_id: params[:timeslot_id]).first
		@timeslot.destroy
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
