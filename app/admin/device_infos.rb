ActiveAdmin.register DeviceInfo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :mfg_date, :mode_name, :setting, :device_id
  filter :device
  #
  # or
  #
  # permit_params do
  #   permitted = [:mfg_date, :mode_name, :setting, :device_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
