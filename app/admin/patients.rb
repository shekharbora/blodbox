ActiveAdmin.register Patient do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :location, :address, :hospital_id, :device_id
  filter :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :location, :address, :hospital_id, :device_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
