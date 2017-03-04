class Flood < ActiveRecord::Base
  has_many :attachments
  validates_formatting_of :email, using: :email
  accepts_nested_attributes_for :attachments

  def location
    #
  end

  def location=(loc)
    #
  end
end
