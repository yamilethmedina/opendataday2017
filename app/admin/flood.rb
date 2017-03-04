ActiveAdmin.register Flood do
  permit_params :first_name, :last_name, :email, :date_of_report, :description, :latitude, :longitude, :salinity, :salinity_units, :water_depth, :water_depth_units

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
