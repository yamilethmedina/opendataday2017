class Attachment < ActiveRecord::Base
  belongs_to :flood
  has_attached_file :upload
end
