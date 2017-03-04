class FloodsController < ApplicationController
  def new
    @flood = Flood.new
    @flood.attachments.build
  end

  def create
    @flood = Flood.new flood_params
    
    if @flood.save
      flash[:notice] = "Thank you for contributing data!"
      redirect_to action: :new
    else
      flash.now[:error] = "Oops. There were errors:\n#{@flood.errors.full_messages.to_sentence}"
      render :new
    end

  end

  private

  def flood_params
    params.require(:flood).permit(
      :first_name,
      :last_name,
      :email,
      :date_of_report,
      :location,
      :address,
      :salinity,
      :salinity_units,
      :water_depth,
      :water_depth_units,
      attachments_attributes: [
        :upload_file_name,
        :upload_file_size,
        :upload_content_type
      ]
    )
  end
end
