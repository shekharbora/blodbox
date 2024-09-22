class PatientsController < ApplicationController

	before_action :find_patient, only: [:edit,:show,:update]
	before_action :find_hospital, only: [:create]
	def index
		@patients = Patient.where(device_id: current_user.devices).order(id: :desc).page params[:page]
	end

	def new
		@patient = Patient.new
		@devices = current_user.devices
	end


	def create
		@patient = Patient.new(patient_params)
		
		if @patient.save
			@patient.reload
			DevicePatient.create(status: "inprogress", device_id: @patient.device_id, patient_id: @patient.id, )
		end
		redirect_to root_path
	end 

	def show

	end 

	def edit
		unless @patient
			redirect_to root_path, notice: "Patient not Created yet!"
		end
	end

	def update
		@patient.update(patient_params)
		redirect_to root_path, notice: "Patient updated!"
	end

	private

	def find_patient
		@patient = Patient.find(params[:id])
	end

	def patient_params
	    params.require(:patient).permit(:name,:location,:address,:hospital_id,:device_id,:request_id,:gender, :dob, :blod_group)
	end

	def find_hospital
		@hospital = current_user.hospital
	end
end
