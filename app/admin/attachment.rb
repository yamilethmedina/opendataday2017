ActiveAdmin.register Attachment do
  permit_params :upload_file_name, :upload_file_type, :upload_file_size
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
index do
    selectable_column
    id_column
    # column "Flood ID" do |flood|
    #     flood.flood_id
    #   end
    column :flood_id
    column :upload_file_name
    column :upload_file_type
    column :upload_file_size
    column 'Attachment URL' do |attachment|
  		full_file_path = "https://s3.amazonaws.com/sealevelriseimages/uploads/" + attachment.upload_file_name
      full_file_path.to_s
      
        link_to(full_file_path.to_s, full_file_path.to_s) 
      
    	

      	end
	end
end
