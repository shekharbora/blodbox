ActiveAdmin.register DevicePatientLog do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :event, :password, :temperature, :weight, :lock, :status, :patient_id, :device_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:event, :password, :temperature, :wight, :lock, :status, :patient_id, :device_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
