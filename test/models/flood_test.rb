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

require 'test_helper'

class FloodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
