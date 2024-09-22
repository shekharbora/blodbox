class Patient < ApplicationRecord
  belongs_to :hospital
  belongs_to :device
  has_one :device_patient
  accepts_nested_attributes_for :device_patient

  attr_accessor :request_id


  after_commit :update_device_request

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "device_id", "hospital_id", "id", "location", "name", "updated_at"]
  end


	def update_device_request
		DeviceRequest.find(self.request_id).update(is_assigne: true)  if self.request_id
	end


end
