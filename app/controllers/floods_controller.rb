class FloodsController < ApplicationController

  def import
    Flood.import(params[:file])

    redirect_to admin_floods_path
  end

  def index
    @flood = Flood.all
  end

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
      :latitude,
      :longitude,
      :attachment,
      :description,
      attachments_attributes: [
        :upload,
        :attachment
      ]
    )
  end
end
