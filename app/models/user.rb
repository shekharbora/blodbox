class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_devices
  has_many :devices, through: :user_devices

  has_one :hospital

	def self.ransackable_attributes(auth_object = nil)
	  ["confirmation_sent_at", "confirmation_token", "confirmed_at", "created_at", "current_sign_in_at", "current_sign_in_ip", "email", "encrypted_password", "failed_attempts", "first_name", "id", "last_name", "last_sign_in_at", "last_sign_in_ip", "locked_at", "remember_created_at", "reset_password_sent_at", "reset_password_token", "sign_in_count", "unconfirmed_email", "unlock_token", "updated_at"]
	end
	def self.ransackable_associations(auth_object = nil)
    ["hospitals","devices"]
  end

	
end
