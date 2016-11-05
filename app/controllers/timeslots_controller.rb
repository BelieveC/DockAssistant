class TimeslotsController < ApplicationController
	before_action :get_timeslot, only:[:edit,:update]

	def new
		@timeslot = Timeslot.new
	end

	def edit
	end

	def create
		@timeslot = Timeslot.new(timeslot_params)
		if @timeslot.save
			redirect_to @timeslot
		else
			render 'new'
		end
	end

	def update 
		if @timeslot.update(timeslot_params)
			redirect_to @timeslot
		else 
			render 'edit'
		end
	end

	private
		def timeslot_params
			params.require(:timeslot).permit(:starttime,:endtime)
		end

		def get_timeslot
			@timeslot = Timeslot.find(params[:id])
		end
end
