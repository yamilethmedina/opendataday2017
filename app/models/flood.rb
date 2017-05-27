# == Schema Information
#
# Table name: floods
#
#  id                :integer          not null, primary key
#  first_name        :string(255)
#  last_name         :string(255)
#  email             :string(255)
#  date_of_report    :datetime
#  description       :text
#  latitude          :string(255)
#  longitude         :string(255)
#  salinity          :decimal(, )
#  salinity_units    :string(255)
#  water_depth       :decimal(, )
#  water_depth_units :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  location          :text
#  address           :string(255)
#

class Flood < ActiveRecord::Base
  has_many :attachments
  has_attached_file :attachment,
  					:storage => :s3,
  					:s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  def s3_credentials
    {:bucket => ENV["AWS_S3_BUCKET_NAME"], :access_key_id => ENV["AWS_ACCESS_KEY_ID"], :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"], :s3_region => ENV["AWS_DEFAULT_REGION"]}
  end
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/
  validates_formatting_of :email, using: :email
  accepts_nested_attributes_for :attachments
  store :location, coder: JSON
end