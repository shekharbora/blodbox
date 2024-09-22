class Hospital < ApplicationRecord
  belongs_to :user, optional: true
  has_many :patients

  
  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "id", "location", "name", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["patients", "user"]
  end
  
end
