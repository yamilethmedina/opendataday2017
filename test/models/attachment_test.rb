# == Schema Information
#
# Table name: attachments
#
#  id                  :integer          not null, primary key
#  flood_id            :integer
#  upload_file_name    :string(255)
#  upload_content_type :string(255)
#  upload_file_size    :integer
#  created_at          :datetime
#  updated_at          :datetime
#

require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
