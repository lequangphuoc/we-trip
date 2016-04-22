# == Schema Information
#
# Table name: attachments
#
#  id         :integer          not null, primary key
#  path       :string
#  trip_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Attachment < ActiveRecord::Base
  belongs_to :trip

  validates_presence_of :trip_id, :path
end
