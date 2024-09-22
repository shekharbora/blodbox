class Device < ApplicationRecord
	has_many :user_devices
	has_many :users,  through: :user_devices
    has_many :patients
    has_many :device_patients
    has_one :device_info
    accepts_nested_attributes_for :device_info

	def self.ransackable_attributes(auth_object = nil)
		["code", "created_at", "id", "status", "updated_at"]
	end

    def to_s
        "#{code}"
    end
end
