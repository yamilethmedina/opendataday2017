class Flood < ActiveRecord::Base
  require 'csv'
  has_many :attachments
  accepts_nested_attributes_for :attachments
  has_attached_file :attachment,
  					:storage => :s3,
  					:s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/
  validates_formatting_of :email, using: :email
  store :location, coder: JSON

  def s3_credentials
    {:bucket => ENV["AWS_S3_BUCKET_NAME"], :access_key_id => ENV["AWS_ACCESS_KEY_ID"], :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"], :s3_region => ENV["AWS_DEFAULT_REGION"]}
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Flood.create!(row.to_h)
    end
  end
end